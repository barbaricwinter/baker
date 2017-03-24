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

cd ${HOME} &&
    mkdir root &&
    mkdir root/code &&
#    ssh-keygen -f ${HOME}/.ssh/id_rsa -P "" -C "${UUID}" &&
#	curl --data-urlencode "key=$(cat ${HOME}/.ssh/id_rsa.pub)" --data-urlencode "title=${UUID}" https://gitlab.363-283.io/api/v3/user/keys?private_token=${GITLAB_PRIVATE_TOKEN}  &&
#	cp /opt/docker/config ${HOME}/.ssh &&
#	chmod 0600 ${HOME}/.ssh &&
    git -C root/code init &&
    git -C root/code config user.name "${GIT_USER_NAME}" &&
    git -C root/code config user.email "${GIT_USER_EMAIL}" &&
    git -C root/code remote add upstream ssh://upstream/cte/object-drive-ui.git &&
    git -C root/code config remote.upstream.pushurl "you really didn't want to do that" &&
    git -C root/code remote add origin ssh://origin/${GITLAB_USERID}/object-drive-ui.git &&
    cp /opt/docker/post-commit.sh root/code/.git/hooks/post-commit &&
    chmod 0500 root/code/.git/hooks/post-commit &&
    git -C root/code fetch upstream develop &&
    git -C root/code checkout upstream/develop &&
    npm set cafile ca.crt &&
    npm set registry https://npm.363-283.io &&
    (npm adduser --registry https://npm.363-283.io <<EOF
${NPM_USERNAME}
${NPM_PASSWORD}
${NPM_EMAIL}
EOF
    ) &&
    echo "strict-ssl=false" >> ${HOME}/.npmrc &&
    cp ${HOME}/.npmrc root &&
    cp -r ${HOME}/.npm root &&
    cp -r ${HOME}/.ssh root &&
    cp /opt/docker/nested/Dockerfile . &&
    cp /opt/docker/nested/run.sh . &&
    cp /opt/docker/nested/entrypoint.sh . &&
    docker build --tag ${IMAGE_TAG} .