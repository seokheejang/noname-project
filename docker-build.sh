# kubectl port-forward service/local-registry 5000:5000

docker build -t msa-server:latest ./msa-server
docker build -t gateway:latest ./gateway
docker build -t client:latest ./client

docker tag gateway:latest local-registry:5000/gateway:latest
docker tag msa-server:latest local-registry:5000/msa-server:latest
docker tag client:latest local-registry:5000/client:latest

# 로컬에 올릴 때 HTTPS Proxy 문제 발생하면, 
# sudo vi /etc/hosts 열어서 "127.0.0.1 local-registry" 추가
docker push local-registry:5000/gateway:latest
docker push local-registry:5000/msa-server:latest
docker push local-registry:5000/client:latest