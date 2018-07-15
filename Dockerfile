FROM archlinux/base

RUN pacman -Sy --needed --noconfirm sudo # Install sudo

RUN useradd builduser -m # Create the builduser

RUN passwd -d builduser # Delete the buildusers password

RUN printf 'builduser ALL=(ALL) ALL\n' | tee -a /etc/sudoers # Allow the builduser passwordless sudo

RUN pacman -Sy --noconfirm grep git xmlto kmod inetutils bc libelf patch make base-devel 
            
USER builduser

WORKDIR /home/builduser

SHELL ["/bin/bash", "-c"] 
