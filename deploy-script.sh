gcloud auth activate-service-account --key-file google.key.json
gcloud config set container/use_client_certificate False
gcloud container clusters get-credentials $CI_GOOGLE_CLUSTER_NAME --zone $CI_GOOGLE_CLUSTER_ZONE --project $CI_GOOGLE_PROJECT_NAME

kubectl apply -f ./repository-docker-secret.yml
kubectl apply -f ./deployments.yaml