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
FROM fedora:25
MAINTAINER Emory Merryman emory.merryman@deciphernow.com
COPY run.sh entrypoint.sh code.sh post-commit.sh config root /opt/docker/
RUN ["/usr/bin/sh", "/opt/docker/run.sh"]
ENTRYPOINT ["/usr/bin/sh", "/opt/docker/code.sh"]
CMD []
VOLUME /home/user
VOLUME /code
VOLUME /docker-compose