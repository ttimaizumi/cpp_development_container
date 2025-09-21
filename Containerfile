FROM fedora:42

# RUN dnf update -y
RUN dnf install -y ninja gcc vim gcc gcc-c++ clang openssh-server lldb clangd libicu python3 pip cmake perl gdb awk npm git bison flex autoconf openssl libtool automake

RUN echo 'PasswordAuthentication yes' >> /etc/ssh/ssh_config
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN echo 'Port 22' >> /etc/ssh/sshd_config

RUN ssh-keygen -A
RUN touch ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys

RUN git clone --depth 1 https://github.com/microsoft/vcpkg.git /opt/vcpkg/
RUN chmod 777 -R /opt/vcpkg

RUN echo "-k" >> ~/.curlrc
RUN /opt/vcpkg/bootstrap-vcpkg.sh

RUN echo 'export PATH=/opt/vcpkg/:$PATH' >> ~/.bashrc


EXPOSE 22 8080

CMD ["sudo", "/usr/sbin/sshd", "-D"]
