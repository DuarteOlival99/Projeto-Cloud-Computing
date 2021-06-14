gcloud config set compute/zone us-central1-f
gcloud container clusters create fancy-cluster --num-nodes 1
gcloud container clusters update fancy-cluster --enable-autoscaling --min-nodes 1 --max-nodes 10 --zone us-central1-f --node-pool default-pool
kubectl apply -f kubernetes.yaml
kubectl apply -f ingress.yaml