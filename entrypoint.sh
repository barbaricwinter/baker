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

mkdir work &&
    ssh-keygen -f ${HOME}/.ssh/id_rsa -P "" -C "${UUID}" &&
	curl --data-urlencode "key=$(cat ${HOME}/.ssh/id_rsa.pub)" --data-urlencode "title=${UUID}" https://gitlab.363-283.io/api/v3/user/keys?private_token=${GITLAB_PRIVATE_TOKEN}  &&
    git -C init &&
    git -C work config user.name "${GIT_USER_NAME}" &&
    git -C work config user.email "${GIT_USER_EMAIL}" &&
    git -C work remote add upstream ssh://upstream/cte/object-drive-ui.git &&
    git -C work config remote.upstream.pushurl "you really didn't want to do that" &&
    git -C work remote add origin ssh://origin/${GITLAB_USERID}/object-drive-ui.git &&
    cp /opt/docker/post-commit.sh .git/hooks/post-commit &&
    chmod 0500 .git/hooks/post-commit &&
    git fetch upstream develop &&
    git checkout upstream/develop