set JRE_HOME=C:\tools\Java\jdk1.8.0_191\jre
set JAVA_HOME=C:\tools\Java\jdk1.8.0_191
set PATH=%PATH%;C:\tools\Java\jdk8.0_191\bin;

set MAVEN_OPTS=-Xmx2G
C:\tools\apache-maven-3.5.4\bin\mvn.cmd clean release:prepare release:perform