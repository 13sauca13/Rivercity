Import-Csv C:\maquinas.csv | ForEach-Object {
    if (Test-Connection -ComputerName $_.Nombre -Count 1 -Quiet){
        Invoke-Command -ComputerName $_.Nombre -ScriptBlock {Stop-Process -Name winlogon -Force}
        Write-Host $_.Nombre ejecutado correctamente}
    else {Write-Host $_.Nombre apagado o fuera de linea}
    }