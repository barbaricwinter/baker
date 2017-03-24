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

apk update &&
    apk upgrade &&
    apk add --no-cache openssh &&
    apk add --no-cache git &&
    apk add --no-cache nodejs &&
    apk add --no-cache python &&
    apk add --no-cache g++ &&
    apk add --no-cache c++ &&
    apk add --no-cache make &&
    npm install -g npm &&
    adduser -D user &&
    cp -r /opt/docker/.ssh /home/user &&
    cp -r /opt/docker/code /home/user &&
    cp /opt/docker/code/ca.crt /home/user &&
    cp -r /opt/docker/.npmrc /home/user &&
    cp -r /opt/docker/.npm /home/user &&
    chown -R user:user /home/user &&
    rm -fr /var/cache/apk/*