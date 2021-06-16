#Credenciales para invocar el comando en el servidor
$credenciales=Get-Credential

(new-object -ComObject wscript.shell).Popup("Va a ejecutar RIVERCITY SUPREMO by SuperSupervisor
Para Rivercity escriba ERC seguido del nivel de rivercity (ej. ERC1)
Para LABTA escriba:
    LABTA0 (sin restricciones)
    LABTA1 (Jefes de Servicio+Oficinas)
    LABTA2 (Oficina General)
Escriba ONE para la limitación a un único usuario (consultar antes de ejecutar esta opción)
 Choose wisely!")

#Esta variable será para excluir del reinicio el ordenador desde el que se ejecuta el script
#$ordenador=Get-ComputerInfo -Property CsName

#Variable para elegir el estado a implementar
$ERC=Read-Host "Introduzca la opción deseada ERCx, LABTAx ó ONE:"

#Inicia un contador de tiempo de ejecucion del script completo
$horainicio=Get-Date

If($ERC -ceq "ERC1"){
    $Estado="Rivercity 1"
    Invoke-Command -ComputerName SRVMENDEZCDW01 -Credential $credenciales -ScriptBlock {C:\scripts\R#1.ps1}
    }
Elseif($ERC -ceq "ERC2"){
    $Estado="Rivercity 2"
    Invoke-Command -ComputerName SRVMENDEZCDW01 -Credential $credenciales -ScriptBlock {C:\scripts\R#2.ps1}
    }
Elseif($ERC -ceq "ERC3"){
    $Estado="Rivercity 3"
    Invoke-Command -ComputerName SRVMENDEZCDW01 -Credential $credenciales -ScriptBlock {C:\scripts\R#3.ps1}
    }
Elseif($ERC -ceq "ERC4"){
    $Estado="Rivercity 4"
    Invoke-Command -ComputerName SRVMENDEZCDW01 -Credential $credenciales -ScriptBlock {C:\scripts\R#4.ps1}
    }
Elseif($ERC -ceq "LABTA0"){
    $Estado="restablecimiento de todos los servicios"
    Invoke-Command -ComputerName SRVMENDEZCDW01 -Credential $credenciales -ScriptBlock {C:\scripts\LABTA0.ps1}
    }
Elseif($ERC -ceq "LABTA1"){
    $Estado="limitación de acceso a oficinas y Jefes de Servicio"
    Invoke-Command -ComputerName SRVMENDEZCDW01 -Credential $credenciales -ScriptBlock {C:\scripts\LABTA1.ps1}
    }
Elseif($ERC -ceq "LABTA2"){
    $Estado="limitación de acceso a oficinas"
    Invoke-Command -ComputerName SRVMENDEZCDW01 -Credential $credenciales -ScriptBlock {C:\scripts\LABTA2.ps1}
    }
Elseif($ERC -ceq "ONE"){
    $Estado="limitación de red excepcional"
    Invoke-Command -ComputerName SRVMENDEZCDW01 -Credential $credenciales -ScriptBlock {C:\scripts\ONE.ps1}
    }
Else {
    (new-object -ComObject wscript.shell).Popup("RUBIA!")
    exit
    }

#Se pide seleccionar si apagar, reiniciar o cerrar sesiones
(new-object -ComObject wscript.shell).Popup("Ahora debe elegir si reiniciar, apagar o cerrar las sesiones:
-Nasti de plasti:   0
-Cerrar sesiones:   1
-Reiniciar equipos: 2
-APAGA!!!:          3")

#Variable para elegir lo que hacer
$reinicio=Read-Host "Introduzca la opción deseada (0, 1, 2, 3):"

$horareinicio=Get-Date

If($reinicio -eq 0){
    (new-object -ComObject wscript.shell).Popup("Hasta luegui!!")
    exit
    }
Elseif($reinicio -eq 1){
    $Instruccion="cerrará las sesiones"
    #Mensaje a los usuarios con la información del reinicio y el ERC que se van a aplicar
    Invoke-Command -Computername SRVMENDEZCDW01 -Credential $credenciales -ScriptBlock {C:\scripts\MENSAJERED.ps1 -Estado $Estado -Instruccion $Instruccion}
    Invoke-Command -ComputerName SRVMENDEZCDW01 -Credential $credenciales -ScriptBlock {C:\scripts\CIERRESESION.ps1}
    $horafin=Get-Date
    }
Elseif($reinicio -eq 2){
    $Instruccion="se reiniciará"
    #Mensaje a los usuarios con la información del reinicio y el ERC que se van a aplicar
    Invoke-Command -Computername SRVMENDEZCDW01 -Credential $credenciales -ScriptBlock {C:\scripts\MENSAJERED.ps1 -Estado $Estado -Instruccion $Instruccion}
    Invoke-Command -ComputerName SRVMENDEZCDW01 -Credential $credenciales -ScriptBlock {C:\scripts\REINICIO.ps1}
    $horafin=Get-Date
    }
Elseif($reinicio -eq 3){
    $Instruccion="se apagará"
    #Mensaje a los usuarios con la información del reinicio y el ERC que se van a aplicar
    Invoke-Command -Computername SRVMENDEZCDW01 -Credential $credenciales -ScriptBlock {C:\scripts\MENSAJERED.ps1 -Estado $Estado -Instruccion $Instruccion}
    Invoke-Command -ComputerName SRVMENDEZCDW01 -Credential $credenciales -ScriptBlock {C:\scripts\APAGADO.ps1}
    $horafin=Get-Date
    }
Else {
    (new-object -ComObject wscript.shell).Popup("RUBIA!")
    exit
    }

(new-object -ComObject wscript.shell).Popup("El ScriptFighter ha empezado a conquistar el mundo a las:
    $horainicio
    Ha empezado a destruírlo a las:
    $horareinicio
    Ha finalizado su misión a las:
    $horafin

    Gracias por confiar en ScriptFighter")
