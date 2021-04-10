#!/bin/sh

# Create and inpect a named volume.
# https://docs.docker.com/engine/reference/commandline/volume_create/
docker volume create --name bigfont-blog-content --driver local
docker volume inspect bigfont-blog-content

# Start Ghost exposed at http://ipaddress:80
# See https://hub.docker.com/_/ghost/
docker run \
    -d \
    -p 80:2368 \
    -v bigfont-blog-content:/var/lib/ghost/content \
    --name bigfont-blog \
    -e url=http://52.228.0.152:80 \
    -e mail__transport=SMTP \
    -e mail__options__service=Mailgun \
    -e mail__options__auth__user=postmaster@mailgun.mydomain.tld \
    -e mail__options__auth__pass=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx-xxxxxxxx-xxxxxxxx \
    ghost:4-alpine 

# First-time Set Up
# 1. Go to http://ipaddress:80/ghost
# 2. Create your account

# TODO [debt] Remane the volume NOT to be associated with 'bigfont-blog'.
# TODO Set up NGINX as a proxy.
# TODO Set up HTTPS.

