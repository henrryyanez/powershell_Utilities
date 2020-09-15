Get-Content -Path "C:\settings.txt" |
    foreach-object `
        -begin {
            # Creo una Hashtable
            $h=@{}
        } `
        -process {
            # Busco las lineas con signo '=' y le aplico split
            $k = [regex]::split($_,'=')
            if(($k[0].CompareTo("") -ne 0) -and ($k[0].StartsWith("[") -ne $True))
            {
                # Agrego la clave, dentro del valor de la Hashtable
                $h.Add($k[0], $k[1])
            }
        } `
        -end {Write-Output $h}
