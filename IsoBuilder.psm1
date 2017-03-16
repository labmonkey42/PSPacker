using module .\Builder.psm1

Class IsoBuilder : Builder
{
    
    IsoBuilder() : base()
    {
        $mytype = $this.GetType()
        if ($mytype -eq [IsoBuilder])
        {
            throw("Class $mytype is abstract and must be implemented")
        }
    }

    [string]$iso_url

    [string]$iso_checksum_type

    [string]$iso_checksum

    [int]$disk_size

}
