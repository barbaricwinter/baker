#!/bin/sh
# This file is part of baker.
#
#    baker is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    baker is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with baker.  If not, see <http://www.gnu.org/licenses/>.

dnf update --assumeyes &&
    dnf install --assumeyes openssh-clients &&
    dnf install --assumeyes git-core &&
    dnf install --assumeyes wget &&
    dnf install --assumeyes tar &&
    dnf install --assumeyes xz &&
    wget https://nodejs.org/dist/v6.10.1/node-v6.10.1-linux-x64.tar.xz &&
    tar --extract --xz --file node-v6.10.1-linux-x64.tar.xz &&
    mv node-v6.10.1-linux-x64 /opt &&
    export PATH=${PATH}:/opt/node-v6.10.1-linux-x64/bin &&
    dnf install --assumeyes bzip2 &&
    dnf install --assumeyes openssh-clients &&
    dnf install --assumeyes curl &&
    dnf install --assumeyes git &&
    dnf install --assumeyes nodejs &&
    adduser --create-home user &&
    mkdir /code &&
    chown user:user /code &&
    mkdir docker-compose &&
    chown user:user /docker-compose &&
    dnf update --assumeyes &&
    dnf clean all