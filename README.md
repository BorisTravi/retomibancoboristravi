# MI BANCO RETO
## Instalado Jenkins con docker-compose
    docker-compose up -d (debe estar dentro del ruta del docker-compose)
    # Para la ruta del docker 
    docker ps -l 
    docker exec jenkins_managed_by_compose cat "Ruta que le brinda jenkins" ( aqui obtien el password para desbloquear)
    
    
## Comandos de terraform 
    terraform init  - iniciando
    terraform validate - validando formato
    terraform  plan - veriticando que se va instalar
    terraform apply - Aplica Iac en la nube azure (antes de eso debe confirar powershell cli para logearse)



