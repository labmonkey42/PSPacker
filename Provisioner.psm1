Class Provisioner
{
    
    Provisioner()
    {
        $mytype = $this.GetType()
        if ($mytype -eq [Provisioner])
        {
            throw("Class $mytype is abstract and must be implemented")
        }
    }

    [string]$name

}