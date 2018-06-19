FROM ubuntu:14.04

RUN apt-get update && apt-get install -y firefox

ENV UID="501"
ENV GID="20"
ENV user="jaci"

# Replace 1000 with your user / group id
#RUN export uid=1000 gid=1000 && \
RUN export uid=${UID} gid=${GID} && \
    mkdir -p /home/${user} && \
    echo "${user}:x:${uid}:${gid}:${user},,,:/home/${user}:/bin/bash" >> /etc/passwd && \
    echo "${user}:x:${uid}:" >> /etc/group && \
    echo "${user} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${user} && \
    chmod 0440 /etc/sudoers.d/${user} && \
    chown ${uid}:${gid} -R /home/${user}

USER "${user}" 
ENV HOME "/home/${user}"
#ENV DISPLAY "docker.for.mac.localhost:0"
#ENV XAUTHORITY=/var/run/lightdm/root/:0
#ENV DISPLAY=:0
CMD /usr/bin/firefox
