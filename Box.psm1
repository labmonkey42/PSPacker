using module .\Machine.psm1
using module .\VagrantPostProcessor.psm1
using namespace System.Collections

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

        $this.VagrantProcessor = $processor
    }

    [VagrantPostProcessor]$VagrantProcessor

    [Array]GetEffectivePostProcessors()
    {
        $postProcessorList = [ArrayList]::new()

        # Use base Machine class to serialize unspecialized PostProcessors
        $postProcessorList.AddRange(([Machine]$this).GetEffectivePostProcessors())

        # Add specialized Post Processor.
        $postProcessorList.Add($this.VagrantProcessor.ToPacker())

        return $postProcessorList.ToArray()
    }
    
}
