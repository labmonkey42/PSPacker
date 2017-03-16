using module .\PostProcessor.psm1

Class VagrantPostProcessor : PostProcessor
{
    
    [ValidateRange(0, 9)]
    [int]$compression_level = 6
    
    [System.Collections.Generic.List[string]]$include
    
    [bool]$keep_input_artifact = $false
    
    [string]$output
    
    [string]$type = "vagrant"
    
    [string]$vagrantfile_template = ".\Vagrantfile.template"

    [System.Collections.Generic.Dictionary[string, System.Collections.Generic.Dictionary[string, object]]]$override

}
