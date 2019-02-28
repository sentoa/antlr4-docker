FROM ubuntu:14.04
MAINTAINER support@servon.eu
RUN apt-get update
RUN apt-get install -y wget
RUN mkdir -p /usr/java
RUN wget -O java.tar.gz https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz --header "Cookie: oraclelicense=accept-securebackup-cookie"
RUN ls 
RUN tar xfz java.tar.gz -C /usr/java
ENV JAVA_HOME /usr/java/jdk1.8.0_40
ENV PATH $PATH:$JAVA_HOME/bin
WORKDIR /usr/local/lib
RUN mkdir -p /usr/java/lib
RUN wget https://www.antlr.org/download/antlr-4.7.2-complete.jar -P /usr/local/lib
RUN echo '#!/bin/bash\njava -jar /usr/local/lib/antlr-4.7.2-complete.jar' > /usr/bin/antlr4
RUN chmod +x /usr/bin/antlr4
RUN echo '#!/bin/bash\njava org.antlr.v4.gui.TestRig' > /usr/bin/grun
RUN chmod +x /usr/bin/grun
ENV CLASSPATH .:/usr/local/lib/antlr-4.7.2-complete.jar:$CLASSPATH
