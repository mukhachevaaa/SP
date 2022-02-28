FROM centos
#RUN yum update -y
#RUN yum upgrade -y
COPY ./proga.sh .
RUN chmod ugo+rwx proga.sh
CMD ./proga.sh