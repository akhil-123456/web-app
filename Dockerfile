FROM redhat/ubi8
RUN yum install java -y
RUN yum install maven -y
RUN yum install wget -y
WORKDIR /APP
COPY . /APP
RUN mvn clean package
RUN mkdir /usr/local/tomcat
RUN wget https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.99/bin/apache-tomcat-7.0.99.tar.gz
RUN tar -xvf apache-tomcat-7.0.99.tar.gz
RUN cp -Rv apache-tomcat-7.0.99/* /usr/local/tomcat
EXPOSE 8080
CMD /usr/local/tomcat/apache-tomcat-7.0.99/bin/catalina.sh run
RUN cp /APP/target/maven-web-application.war /usr/local/tomcat/webapps
