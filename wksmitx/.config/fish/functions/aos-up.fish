# Defined in - @ line 0
function aos-up --description 'Start AOS app'
    docker-compose up -d --no-deps mongo redis postgres minio-server minio-client keycloak aos-api-authorization aos-client-app aos-server-app $argv
end
