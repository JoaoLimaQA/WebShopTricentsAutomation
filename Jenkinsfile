pipeline {
    agent any

    stages {
        stage('Check Environment') {
    steps {
        sh '''
            echo "PATH:"
            echo $PATH

            echo "Python:"
            python3 --version || true

            echo "Pip:"
            pip3 --version || true

            echo "Robot:"
            robot --version || true

            echo "Git:"
            git --version
        '''
    }
}
//        stage('Node.js Dependecies') {
//            steps {
//                sh 'pip install -r requirements.txt'
//
//            }
//        }
//        stage('Install Browsers') {
//            steps {
//                sh 'rfbrowser init'
//            }
//        }
//         stage('Autmoation Tests') {
//            steps {
//                sh 'robot tests/'
//            }
//    }
//}
//
