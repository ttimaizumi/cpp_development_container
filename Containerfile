FROM fedora:latest

RUN dnf install -y gcc vim clang openssh-server meson lldb conan clangd

RUN sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
RUN sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config

RUN ssh-keygen -A
RUN touch ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys

RUN mkdir /devenv && mkdir /devenv/workspace && mkdir /devenv/workspace/service

#copy public key into container for autmatic login
COPY ~/.ssh/id_ed25519.pub /devenv

RUN cat /devenv/id_ed25519.pub > ~/.ssh/authorized_keys

EXPOSE 22 8080

CMD ["/usr/sbin/sshd", "-D"]
