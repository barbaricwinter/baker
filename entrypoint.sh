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

(cat <<EOF
${DOCKERHUB_USERNAME}
${DOCKERHUB_PASSWORD}
EOF
) | docker login &&
    (cat > Dockerfile <<EOF
    FROM alpine:3.4
    COPY run.sh entrypoint.sh ${HOME}/.docker /opt/docker/
    RUN ["/bin/sh", "/opt/docker/run.sh"]
    ENTRYPOINT ["/bin/sh", "/opt/docker/entrypoint.sh"]
EOF
    )
    (cat > run.sh <<EOF
#!/bin/sh

apk update &&
    apk upgrade &&
    apk add --no-cache nodejs &&
    npm install -g npm jspm gulp &&
    cp -r /opt/docker/.docker /root/.docker &&
    rm -rf /var/cache/apk/*
EOF
    ) &&
    (cat > entrypoint.sh <<EOF
#!/bin/sh

bash
EOF
    ) &&
    docker build --tag ${TAG} .