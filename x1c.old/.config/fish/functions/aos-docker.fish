# Defined in - @ line 0
function aos-docker --description 'Start AOS docker containers'
    docker-compose up -d mongo redis postgres minio-server keycloak aos-client-app aos-server-app $argv
end
