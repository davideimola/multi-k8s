docker build -t davideimola/fibonacci:latest -t davideimola/fibonacci:$SHA -f ./client/Dockerfile ./client
docker build -t davideimola/fibonacci-server:latest -t davideimola/fibonacci-server:$SHA -f ./server/Dockerfile ./server
docker build -t davideimola/fibonacci-worker:latest -t davideimola/fibonacci-worker:$SHA -f ./worker/Dockerfile ./worker

docker push davideimola/fibonacci:latest
docker push davideimola/fibonacci-server:latest
docker push davideimola/fibonacci-worker:latest

docker push davideimola/fibonacci:$SHA
docker push davideimola/fibonacci-server:$SHA
docker push davideimola/fibonacci-worker:$SHA

# kubectl apply -f k8s
# kubectl set image deployments/server-depoyment server=davideimola/fibonacci-server:$SHA
# kubectl set image deployments/client-depoyment server=davideimola/fibonacci:$SHA
# kubectl set image deployments/worker-depoyment server=davideimola/fibonacci-worker:$SHA