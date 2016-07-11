FROM registry.access.redhat.com/jboss-eap-7/eap70-openshift

MAINTAINER Mario Mendoza

# Delete configuration file
#RUN rm /opt/eap/standalone/configuration/standalone.xml

# Copy modified configuration file
#RUN curl  -q  ${REPOSITORY_URL}/raw/master/${ARTIFACT_ID}/jbosseap7/standalone.xml?private_token=xxxxx -o /opt/eap/standalone/configuration/standalone.xml

# obtain artifact
#RUN curl -o /opt/eap/standalone/deployments/ROOT.war -fSL  "http://srkmcontdelivery.mutua.es/JINGA4X/oslog/raw/master/oslog.war"
COPY oslog.war /opt/eap/standalone/deployments/ROOT.war

# Enable binding to all network interfaces
RUN echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.node.name=webmutuaNode -Xms400m -Xmx400m\"" >> /opt/eap/bin/standalone.conf

# ports
EXPOSE 8080

#CMD ["/opt/eap/bin/standalone.sh"]
