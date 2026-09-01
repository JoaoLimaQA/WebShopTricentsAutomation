pipeline {
    agent any

    stages {
        stage('Node.js Dependecies') {
            steps {
                sh 'pip install -r requirements.txt'

            }
        }
        stage('Install Browsers') {
            steps {
                sh 'rfbrowser init'
            }
        }
         stage('Autmoation Tests') {
            steps {
                sh 'robot tests/'
            }
        }
         stage('Deploy') {
            steps {
                echo 'Publicando Versão no ambiente de QA'
            }
        }
        stage('Pronto para Produção') {
            steps {
                echo 'Gerando novo pacote para produção'
            }
        }
    }
}
