FROM elixir:1.4.4

RUN apt-get update && apt-get install postgresql-client-9.4 -y

# Set up node
ENV NODE_VERSION=v6.11.0

# Because docker runs in non-iteractive sh we need to manually setup the node environment
ENV NVM_BIN=/root/.nvm/versions/node/${NODE_VERSION}/bin \
    NVM_DIR=/root/.nvm \
    PATH=/root/.nvm/versions/node/${NODE_VERSION}/bin:$PATH \
    NVM_CD_FLAGS=''

COPY nvm-install-v0.33.2.sh nvm-install.sh

# Install NVM. we need to source the nvm script before running nvm
# because we're in sh and nvm defines shell functions
RUN ./nvm-install.sh && \. $NVM_DIR/nvm.sh && nvm install $NODE_VERSION

RUN npm config set cache /app/.npm

RUN mix local.hex --force

RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

RUN mix local.rebar --force

EXPOSE 4000

RUN mkdir -p /app

WORKDIR /app

RUN apt-get update && apt-get install -y inotify-tools

VOLUME /app

