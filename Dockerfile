FROM tomcat:latest

# Optional: Copy default webapps to a backup location
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps

# Copy the WAR file from the build context to the Tomcat webapps directory
COPY .war /usr/local/tomcat/webapps
