using module .\Builder.psm1

Class VMBuilder : Builder
{
    
    VMBuilder() : base()
    {
        $mytype = $this.GetType()
        if ($mytype -eq [VMBuilder])
        {
            throw("Class $mytype is abstract and must be implemented")
        }
    }

    [string]$source_path

}
