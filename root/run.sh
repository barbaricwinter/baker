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
    apk add --no-cache docker &&
    apk add --no-cache bash &&
    ls -1 /opt/docker/bin/ | while read BIN
    do
        cp /opt/docker/bin/${BIN} /usr/local/bin/${BIN%.*} &&
        chmod 0500 /usr/local/bin/${BIN%.*}
    done &&
    rm -fr /var/cache/apk/*