pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin:/usr/bin:/bin:${env.PATH}"
        HEADLESS = "true"
    }

    stages {

        stage('Python Dependencies') {
            steps {
                sh '''
                    python3 -m venv .venv
                    .venv/bin/python -m pip install --upgrade pip
                    .venv/bin/pip install -r requirements.txt
                '''
            }
        }

        stage('Install Browsers') {
            steps {
                sh '''
                    node --version
                    npm --version
                    .venv/bin/rfbrowser init
                '''
            }
        }

        stage('Automation Tests') {
            steps {
                sh '''
                    .venv/bin/robot tests/
                '''
            }
        }
    }
}