# docker-botpress
Docker image for Botpress (https://botpress.io/)

## Usage

### Initialize a new bot

`docker run --rm -it -v my-bot-dir:/data jtdoepke/botpress init`


### Run a bot

`docker run -d -p 3000:3000 -v my-bot-dir:/data jtdoepke/botpress`
