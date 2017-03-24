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

    [string]$IsoUrl

    [string]$IsoChecksumType

    [string]$IsoChecksum

    [int]$DiskSize

}
