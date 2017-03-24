Class Builder
{
    
    Builder()
    {
        $mytype = $this.GetType()
        if ($mytype -eq [Builder])
        {
            throw("Class $mytype is abstract and must be implemented")
        }
    }

    [string]$Type

    [string]$BootWait = "2m"

    [string]$OutputDirectory

    [string]$ShutdownCommand

    [Hashtable]ToPacker()
    {
        $packer = @{}
        
        return $packer
    }

}
