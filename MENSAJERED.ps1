Import-Csv C:\maquinas.csv | ForEach-Object {
    if (Test-Connection -ComputerName $_.Nombre -Count 1 -Quiet){
        Invoke-Command -ComputerName $_.Nombre -ScriptBlock {msg * "Este equipo, $_.Nombre, $instruccion por establecimiento de $Estado. Guarde su trabajo."}
        Write-Host $_.Nombre avisado}
    else {Write-Host $_.Nombre apagado o fuera de linea}
    }