# 基础镜像
# FROM：指定基础镜像，必须为第一个命令
FROM centos-java:1.8.191
#维护者信息
#MAINTAINER: 维护者信息
MAINTAINER 薇恩

# JDK配置
# ADD：将本地文件添加到容器中，tar类型文件会自动解压(网络压缩资源不会被解压)，可以访问网络资源，类似wget
#ADD jdk-8u191-linux-x64.tar.gz /usr/local/src
## ENV：设置环境变量
#ENV JAVA_HOME=/usr/local/src/jdk1.8.0_191
#ENV PATH=$JAVA_HOME/bin:$PATH
#ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

# RUN用于在镜像容器中执行命令
RUN rm -rf CATALINA_HOME/webapps/*
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone

# VOLUME：用于指定持久化目录
VOLUME /tmp

ADD ./target/crossgate-gateway-0.0.1-SNAPSHOT.jar app.jar
# RUN bash -c 'touch /app.jar'
# ENTRYPOINT：配置容器，使其可执行化。配合CMD可省去"application"，只使用参数。
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
# EXPOSE：指定于外界交互的端口
EXPOSE 8888
