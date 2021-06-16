Import-Module ActiveDirectory
Import-Module GroupPolicy
        Set-GPLink -Name RIVERCITY -Target "ou=500_Aniversario,ou=Usuarios,dc=MENDEZ,dc=LOCAL" -LinkEnabled no -Enforced no
        Set-GPLink -Name RIVERCITY -Target "ou=COMANDETALL,ou=Usuarios,dc=MENDEZ,dc=LOCAL" -LinkEnabled no -Enforced no
        Set-GPLink -Name RIVERCITY -Target "ou=COMISIONADOS,ou=Usuarios,dc=MENDEZ,dc=LOCAL" -LinkEnabled yes -Enforced yes
        Set-GPLink -Name RIVERCITY -Target "ou=DESEMBARCOS,ou=Usuarios,dc=MENDEZ,dc=LOCAL" -LinkEnabled yes -Enforced yes
        Set-GPLink -Name RIVERCITY -Target "ou=ONE,ou=Usuarios,dc=MENDEZ,dc=LOCAL" -LinkEnabled yes -Enforced yes
        Set-GPLink -Name RIVERCITY -Target "ou=GAVA,ou=Usuarios,dc=MENDEZ,dc=LOCAL" -LinkEnabled yes -Enforced yes
        Set-GPLink -Name RIVERCITY -Target "ou=R#1,ou=Usuarios,dc=MENDEZ,dc=LOCAL" -LinkEnabled no -Enforced no
        Set-GPLink -Name RIVERCITY -Target "ou=R#2,ou=Usuarios,dc=MENDEZ,dc=LOCAL" -LinkEnabled no -Enforced no
        Set-GPLink -Name RIVERCITY -Target "ou=R#3,ou=Usuarios,dc=MENDEZ,dc=LOCAL" -LinkEnabled no -Enforced no
        Set-GPLink -Name RIVERCITY -Target "ou=R#4,ou=Usuarios,dc=MENDEZ,dc=LOCAL" -LinkEnabled yes -Enforced yes