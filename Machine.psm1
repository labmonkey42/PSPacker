using module .\Builder.psm1
using module .\PostProcessor.psm1
using module .\Provisioner.psm1
using namespace System.Collections
using namespace System.Collections.Generic

Class Machine
{
    
    Machine()
    {
        $mytype = $this.GetType()
        if ($mytype -eq [Machine])
        {
            throw("Class $mytype is abstract and must be implemented")
        }

        $this.Builders = [List[Builder]]::new()
        $this.PostProcessors = [List[PostProcessor]]::new()
        $this.Provisioners = [List[Provisioner]]::new()
        $this.Variables = [Dictionary[string,string]]::new()
    }

    [List[Builder]]$Builders

    [string]$Description

    [string]$MinPackerVersion

    [List[PostProcessor]]$PostProcessors

    [List[Provisioner]]$Provisioners

    [Dictionary[string, string]]$Variables

    [Array]GetEffectiveBuilders()
    {
        $builderList = [List[Hashtable]]::new()
        
        Foreach ($builder in $this.Builders)
        {
            $builderList.Add($builder.ToPacker())
        }

        return $builderList.ToArray()
    }

    [Array]GetEffectivePostProcessors()
    {
        $processorList = [List[Hashtable]]::new()
        
        Foreach ($processor in $this.PostProcessors)
        {
            $processorList.Add($processor.ToPacker())
        }
        
        return $processorList
    }

    [Array]GetEffectiveProvisioners()
    {
        $provisionerList = [List[Hashtable]]::new()
        
        Foreach ($provisioner in $this.Provisioners)
        {
            $provisionerList.Add($provisioner.ToPacker())
        }
        
        return $provisionerList
    }

    [Hashtable]GetEffectiveVariables()
    {
        $variableTable = @{}
        
        Foreach ($key in $this.Variables.Keys)
        {
            $variableTable.Add($key, $this.Variables[$key])
        }
        
        return $variableTable
    }

    [string]ToJson()
    {
        return ($this.ToPacker() | ConvertTo-Json -Depth 999)
    }

    [Hashtable]ToPacker()
    {
        $packer = @{}
        
        $packer.Add("description", $this.Description)
        $packer.Add("min_packer_version", $this.MinPackerVersion)

        $packer.Add("builders", $this.GetEffectiveBuilders())
        
        $tmpPostProcessors = $this.GetEffectivePostProcessors()
        If (0 -lt $tmpPostProcessors.Count)
        {
            $packer.Add("post-processors", $tmpPostProcessors)
        }
        
        $tmpProvisioners = $this.GetEffectiveProvisioners()
        If (0 -lt $tmpProvisioners.Count)
        {
            $packer.Add("provisioners", $tmpProvisioners)
        }
        
        $tmpVariables = $this.GetEffectiveVariables()
        If (0 -lt $tmpVariables.Count)
        {
            $packer.Add("variables", $tmpVariables)
        }
        
        return $packer
    }

}
