# kubectl port-forward service/local-registry 5000:5000

# Nexus에 로그인 (이미 로그인되어 있지 않다면)
# 아래 명령어에서 <your-nexus-username>과 <your-nexus-password>를 실제 Nexus 로그인 정보로 대체
docker login nexus.local:8081 --username admin --password admin123

# Docker 이미지 빌드
docker build -t gateway:latest ./gateway
docker build -t msa-server:latest ./msa-server
docker build -t client:latest ./client

# Nexus에 푸시할 이미지 태그
docker tag gateway:latest nexus.local:8081/gateway:latest
docker tag msa-server:latest nexus.local:8081/msa-server:latest
docker tag client:latest nexus.local:8081/client:latest

# 이미지 푸시 (Nexus로 푸시)
docker push nexus.local:8081/gateway:latest
docker push nexus.local:8081/msa-server:latest
docker push nexus.local:8081/client:latest
