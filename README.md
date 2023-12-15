# Reproduction repository for FrankenPHP issue #386

## What is it
A boilerplate Symfony application inside a modified FrankenPHP Docker image

The image modifies a `php.ini` param on build

Its web interface displays `phpinfo()`;


## What should I run
* Start the project `docker compose up -d`
* Go on `localhost` and see look at the output. In 'memory' you'll see the default '128M'
* Now log into the container `docker compose exec frank bash` and output a phpinfo : `php -r "phpinfo(); | grep memory"`. You'll see the expected, modified, value of `512` instead of `128`


## Then what
This shows that the SAPI and the CLI are somehow using different `php.ini` config files.

If you modify `/app/php.ini`, the SAPI picks up the change