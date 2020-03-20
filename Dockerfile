FROM python:3.6.9

# User creation
ARG USER=mowa
ARG UID=1000
ARG GID=1000
ARG PW=12345

RUN ls
RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | chpasswd
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd


# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Expand : Python installation
RUN pip install tensorflow==1.15 keras==2.2.4 segmentation-models tifffile
RUN pip install gdown

# Expand : Ubuntu installation
RUN apt-get install -y wget unzip


EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
#CMD ["/bin/bash"]
