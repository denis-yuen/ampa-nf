FROM fedora:20
MAINTAINER Paolo Di Tommaso <paolo.ditommaso@gmail.com>

#
# Create the home folder 
#
RUN mkdir -p /root; mkdir -p /root/bin
ENV HOME /root

#
# Install pre-requistes
#
RUN yum install -q -y bc which wget nano unzip make gcc g++ perl-devel perl-CPAN

RUN wget -q -O cpanm http://cpanmin.us; \
  chmod +x cpanm && mv cpanm /usr/local/bin/; \ 
  cpanm -q -n Math::CDF Math::Round Bio::SeqIO
 
#
# Install Java 
#  
RUN wget -q --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-linux-x64.tar.gz; \
  tar xf jdk-8u25-linux-x64.tar.gz -C /opt; \
  rm -f jdk-8u25-linux-x64.tar.gz; 
  
ADD bin/ /root/bin/

ENV JAVA_HOME /opt/jdk1.8.0_25
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/bin:/opt/jdk1.8.0_25/bin 
 



