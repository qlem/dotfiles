# Defined in - @ line 0
function aos-docker --description 'Start AOS docker containers'
    docker-compose up -d --no-deps mongo redis postgres minio-server keycloak aos-api-authorization aos-client-app aos-server-app $argv
end
