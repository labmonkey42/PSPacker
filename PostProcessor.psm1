Class PostProcessor
{
    
    PostProcessor()
    {
        $mytype = $this.GetType()
        if ($mytype -eq [PostProcessor])
        {
            throw("Class $mytype is abstract and must be implemented")
        }
    }

    [string]$type

}