# Defined in - @ line 0
function aos-up --description 'Start AOS app'
    docker-compose up -d --no-deps mongo redis postgres keycloak minio-server minio-client aos-api-authorization aos-api-consultation aos-server-mail aos-serverless-invite-bookmark aos-serverless-invite-template aos-serverless-stats aos-server-app aos-client-app $argv
end
