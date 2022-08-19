pipeline {
    agent any
    tools{
        maven 'maven'
        jdk 'local_jdk'
    }
    stages {
        stage ('checkout'){
            steps {
                cleanWs()
                git 'https://github.com/akhil-123456/web-app.git'
            }
            
        }
        
        stage ('build'){
            steps {
                sh 'mvn -Dskiptests clean package'
            }
            post {
                always {
                    archiveArtifacts artifacts: '**/*.war', followSymlinks: false
                }
            }
        }
        stage ('tests') {
            steps {
                sh 'mvn test'
            }
        }
        stage ('docker build & push'){
            steps {
                sh '''docker build -t puja .
docker tag puja:latest akhilmahata/jar:v2
docker push akhilmahata/jar:v2'''
            }
        }
    
    }
}
