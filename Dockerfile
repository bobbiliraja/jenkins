FROM tomcat:8
COPY $WORKSPACE/target/*.war /usr/local/tomcat/webapps/