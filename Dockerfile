FROM ubuntu
COPY var16.cpp .
RUN apt-get update
RUN apt-get install -y nano
RUN apt-get install -y binutils
RUN apt-get update
RUN apt-get install -y gcc-multilib gdb
RUN apt-get update
RUN apt-get install -y g++
