FROM almalinux
RUN yum -y update
COPY ./script.sh .
RUN chmod ugo+rwx script.sh
CMD ./script.sh
