# HUGO and NGINX Docker Compose

This project will allow you to launch [NGINX](https://www.nginx.com) and [HUGO](https://gohugo.io) very quickly via docker compose.

NGINX docker also handle creation of SSL certificates automatically ([Let's Encrypt](https://letsencrypt.org/))

To achieve this, I used the following docker images : [nginx-proxy](https://hub.docker.com/r/jwilder/nginx-proxy) from jwilder and [docker-hugo](https://hub.docker.com/r/jojomi/hugo) from jojomi.

Considering you already have a working docker & docker-compose environment. (if not, you can follow [this](https://support.netfoundry.io/hc/en-us/articles/360057865692-Installing-Docker-and-docker-compose-for-Ubuntu-20-04))

Now you can clone this repository on your environment and let's go :

## Step 1 : Choose an HUGO theme

By default, I have added the [Jane](https://github.com/xianmin/hugo-theme-jane) themes (hugo/themes/jane)

But you can choose another one (skip this step if you want keep jane theme):
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

After few seconds, your Hugo generated static website is ready to use:

`http://xxx.xxx.xxx.xxx:1313/` or `https://your-domain.com`

## Useful commands:

You can check the containers state with the following command:

```
docker ps -a
```

NGINX logs (assuming, the nginx container name is "nginx-proxy"):

```
# follow log live on stdout:
docker logs --follow nginx-proxy

# show only last 10 entries:
docker logs --tail 10 nginx-proxy
```

Hugo logs (assuming the Hugo container name is "hugo"):

```
# follow log live on stdout:
docker logs --follow hugo

# show only last 10 entries:
docker logs --tail 10 hugo
```

Restart NGINX (assuming, the nginx container name is "nginx-proxy"):

```
docker exec -it nginx-proxy nginx -s reload
```

