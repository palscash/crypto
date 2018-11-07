cls 

set JRE_HOME=C:\tools\Java\jdk1.8.0_45\jre
set JAVA_HOME=C:\tools\Java\jdk1.8.0_45
set PATH=%PATH%;C:\tools\Java\jdk8.0_45\bin;

set MAVEN_OPTS=-Xmx2G
C:/tools/maven3.2.2/bin/mvn.bat -T 1C test sonar:sonar -Dsonar.host.url=http://localhost:9000  -Dsonar.login=d14e126398edf4b7a55390bc0506d83ed5fcb43d

