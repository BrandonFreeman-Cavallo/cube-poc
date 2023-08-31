FROM centos:centos7

# Create the directory for deployment.
ENV StarRocks_home=/data/deploy

# Install relevant tools.
RUN yum -y install mysql net-tools telnet wget

# Run the setup script.
COPY sql/* $StarRocks_home/sql/

COPY run_script.sh $StarRocks_home/run_script.sh
RUN chmod +x $StarRocks_home/run_script.sh
CMD $StarRocks_home/run_script.sh
