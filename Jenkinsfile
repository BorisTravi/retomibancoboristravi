pipeline {

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: '¿Ejecutar automáticamente la solicitud después de generar el plan?')
    } 
    environment {
        AZURE_CLIENT_ID         = credentials('AZURE_CLIENT_ID')
        AZURE_CLIENT_SECRET     = credentials('AZURE_CLIENT_SECRET')
    }

   agent  any
    stages {
        stage('checkout') {
            steps {
                 script{
                        dir("terraform")
                        {
                            git "https://github.com/yeshwanthlm/Terraform-Jenkins.git"
                        }
                    }
                }
            }

        stage('Plan') {
            steps {
                sh 'pwd;cd terraform/ ; terraform init'
                sh "pwd;cd terraform/ ; terraform plan -out tfplan"
                sh 'pwd;cd terraform/ ; terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
           }

           steps {
               script {
                    def plan = readFile 'terraform/tfplan.txt'
                    input message: "¿Quieres aplicar el plan?",
                    parameters: [text(name: 'Plan', description: 'Por favor revise el plan', defaultValue: plan)]
               }
           }
       }

        stage('Apply') {
            steps {
                sh "pwd;cd terraform/ ; terraform apply -input=false tfplan"
            }
        }
    }

  }