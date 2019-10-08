docker build -t andreasgarvik/multiple-client:latest -t andreasgarvik/multiple-client:$SHA -f ./client/Dockerfile ./client
docker build -t andreasgarvik/multiple-server:latest -t andreasgarvik/multiple-server:$SHA -f ./server/Dockerfile ./server
docker build -t andreasgarvik/multiple-worker:latest -t andreasgarvik/multiple-worker:$SHA -f ./worker/Dockerfile ./worker
docker push andreasgarvik/multiple-client:latest
docker push andreasgarvik/multiple-client:$SHA
docker push andreasgarvik/multiple-server:latest
docker push andreasgarvik/multiple-server:$SHA
docker push andreasgarvik/multiple-worker:latest
docker push andreasgarvik/multiple-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=andreasgarvik/multiple-client:$SHA
kubectl set image deployments/server-deployment server=andreasgarvik/multiple-server:$SHA
kubectl set image deployments/worker-deployment worker=andreasgarvik/multiple-worker:$SHA

