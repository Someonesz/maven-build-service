FROM maven:3-jdk-11

# SSH公钥
ARG PUBLIC_KEY

# 安装并配置 sshd 服务
RUN apt-get update \
    && apt-get install -y openssh-server \
    && apt-get clean \
    && mkdir -p /run/sshd \
    && mkdir -p /root/.ssh \
    && touch /root/.ssh/authorized_keys \
    && chmod 700 /root/.ssh/ \
    && chmod 600 /root/.ssh/authorized_keys \
    && chown -R root:root /root/.ssh/ \
    && echo "$PUBLIC_KEY" > /root/.ssh/authorized_keys 

# 暴露 22 端口
EXPOSE 22

ADD ./docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["bash", "/docker-entrypoint.sh"]
