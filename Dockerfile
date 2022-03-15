FROM ubuntu
COPY helloworld.s .
COPY var16.s .
COPY var_16.cpp .
RUN apt-get update
RUN apt-get install -y nano
RUN apt-get install -y binutils
RUN apt-get update
RUN apt-get install -y gcc-multilib
RUN apt-get install -y g++
RUN apt-get install -y gdb
