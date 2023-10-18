FROM tomcat:8-jdk11-corretto-al2
RUN rm -rf /usr/local/tomcat/webapps/ROOT
RUN rm -rf /usr/local/tomcat/webapps/examples
ADD HomePage.war /usr/local/tomcat/webapps/


EXPOSE 8080
CMD ["catalina.sh", "run"]