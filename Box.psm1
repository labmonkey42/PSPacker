using module .\Machine.psm1
using module .\VagrantPostProcessor.psm1

Class Box : Machine
{

    Box($CompressionLevel = 6, $KeepInputArtifact = $false) : base()
    {
        $mytype = $this.GetType()
        if ($mytype -eq [Box])
        {
            throw("Class $mytype is abstract and must be implemented")
        }

        $processor = [VagrantPostProcessor]::new()
        $processor.compression_level = $CompressionLevel
        $processor.keep_input_artifact = $KeepInputArtifact

        $this.post_processors.Add($processor)
    }
    
}
