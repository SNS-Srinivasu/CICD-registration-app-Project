FROM tomcat:latest
RUN cp -R  /usr/local/tomcat/webapp.dist/*  /usr/local/tomcat/webapp
COPY ./*app.war /usr/local/tomcat/webapp

