#mariadb dockerfile config
FROM debian:buster

ARG USERNAME=romain
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
	&& useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
	# [Optional] Add sudo support for the non-root user
	&& apt-get update && apt-get install -y sudo \
	&& echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
	&& chmod 0440 /etc/sudoers.d/$USERNAME

RUN apt-get update && apt-get install -y mariadb-server vim
LABEL version="1.0"
LABEL description="MariaDB Server"

HEALTHCHECK --start-period=5m \
	CMD mariadb -e 'SELECT @@datadir;' || exit 1
