using module .\Builder.psm1
using module .\PostProcessor.psm1
using module .\Provisioner.psm1

Class Machine
{
    
    Machine()
    {
        $mytype = $this.GetType()
        if ($mytype -eq [Machine])
        {
            throw("Class $mytype is abstract and must be implemented")
        }
    }

    [System.Collections.Generic.List[Builder]]$builders

    [string]$description

    [string]$min_packer_version

    [System.Collections.Generic.List[PostProcessor]]$post_processors

    [System.Collections.Generic.List[Provisioner]]$provisioners

    [System.Collections.Generic.Dictionary[string, string]]$variables

}
