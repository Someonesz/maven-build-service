# Maven编译服务

基于Maven官方镜像，添加了sshd

构建镜像时部署公钥：
```
docker build \
  -t maven-build-service \
  --build-arg PUBLIC_KEY="" \
  .
```

运行镜像时部署公钥：
```
docker run -d \
  --name maven-build-service \
  -e PUBLIC_KEY="" \
  maven-build-service
```
