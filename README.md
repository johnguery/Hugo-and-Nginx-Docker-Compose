# HUGO and NGINX Docker Compose

This project will allow you to launch NGINX and HUGO very quickly via docker compose.

To achieve this, I used the following docker images : [nginx-proxy](https://hub.docker.com/r/jwilder/nginx-proxy) from jwilder and [docker-hugo](https://hub.docker.com/r/jojomi/hugo) from jojomi.

Considering you already have a working docker & docker-compose environment. (if not, you can follow [this](https://support.netfoundry.io/hc/en-us/articles/360057865692-Installing-Docker-and-docker-compose-for-Ubuntu-20-04))

Now you can clone this repository on your environment and let's go :

## Step 1 : Choose an HUGO theme

By default, I have added the [Jane](https://github.com/xianmin/hugo-theme-jane) themes (hugo/themes/jane)

But you can choose another one :
- Upload it to the hugo/themes folder
- Update `HUGO_THEME` in hugo/docker-compose.yml with the theme name

## Step 2 : Update environment variables

In hugo/docker-compose.yml, update the following variables according to your needs: 

* `HUGO_THEME` (set the theme name you want to use)
* `HUGO_WATCH` (set to any value to enable watching)
* `HUGO_DESTINATION` (Path where hugo will render the site. By default `/output`)
* `HUGO_REFRESH_TIME` (in seconds, only applies if not watching, if not set, the container will build once and exit)
* `HUGO_BASEURL` (url of your project)
* `VIRTUAL_HOST` (url of your project)
* `LETSENCRYPT_HOST` (url of your project)
* `LETSENCRYPT_EMAIL` (your email)

## Step 2 : Start docker containers

First, you must create the nginx-proxy docker network with this command:

`docker network create nginx-proxy`

Then, make the start.sh file executable :

`chmod +x start.sh`

Now, you can start both NGINX and HUGO container :

`./start.sh`
