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

    [string]$type

    [string]$boot_wait = "2m"

    [string]$output_directory

    [string]$shutdown_command

}
