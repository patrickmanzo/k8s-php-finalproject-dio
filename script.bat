echo "Building images..."

docker build -t patrickmanzo/backend-k8s-dio:1.0 backend/.
docker build -t patrickmanzo/database-k8s-dio:1.0 database/.

echo "Push"

docker push patrickmanzo/backend-k8s-dio:1.0
docker push patrickmanzo/database-k8s-dio:1.0

echo "Deploying services..."

kubectl apply -f ./services.yml

echo "Deploying..."

kubectl apply -f ./deployment.yml