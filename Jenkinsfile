pipeline {
    agent any

    stages {

        stage('Check Environment') {
            steps {
                sh '''
                    echo "=== Python ==="
                    python3 --version

                    echo "=== Pip ==="
                    python3 -m pip --version

                    echo "=== Git ==="
                    git --version
                '''
            }
        }

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