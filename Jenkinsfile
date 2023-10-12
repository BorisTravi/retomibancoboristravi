pipeline {

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    } 
    environment {
        AZURE_CLIENT_ID     = credentials('AZURE_CLIENT_ID')
        AZURE_CLIENT_SECRET = credentials('AZURE_CLIENT_SECRET')
    }

   agent  any
    stages {
        stage('checkout') {
            steps {
                 script{
                        dir("terraform")
                        {
                            git 'https://github.com/BorisTravi/retomibancoboristravi.git'
                        }
                    }
                }
            }
    stage('prueba') {
        steps {
            script {
                def currentDir = sh(returnStdout: true, script: 'pwd').trim()  // Obtiene la ruta actual

                echo "El directorio actual es: ${currentDir}"

                def terraformDir = "${currentDir}/terraform"  // Ruta completa al directorio Terraform
                echo "La ruta completa del directorio Terraform es: ${terraformDir}"

                sh "cd ${terraformDir}; terraform init"
                sh "cd ${terraformDir}; terraform plan -out tfplan"
                sh "cd ${terraformDir}; terraform show -no-color tfplan > tfplan.txt"
            }
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
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
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
