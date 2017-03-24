using module .\PostProcessor.psm1

Class VagrantPostProcessor : PostProcessor
{
    
    [ValidateRange(0, 9)]
    [int]$CompressionLevel = 6
    
    [System.Collections.Generic.List[string]]$Include
    
    [bool]$KeepInputArtifact = $false
    
    [string]$Output
    
    [string]$Type = "vagrant"
    
    [string]$VagrantfileTemplate = ".\Vagrantfile.template"

    [System.Collections.Generic.Dictionary[string, System.Collections.Generic.Dictionary[string, object]]]$Override

}
