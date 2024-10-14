gcloud config set container/use_client_certificate False
gcloud container clusters get-credentials $CI_GOOGLE_CLUSTER_NAME --zone $CI_GOOGLE_CLUSTER_ZONE --project $CI_GOOGLE_PROJECT_NAME

kubectl apply -f ./registry-dockerhub-secret.yml
kubectl apply -f ./deployment.yaml