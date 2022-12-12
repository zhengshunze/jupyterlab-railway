#!/bin/bash

echo -e '---------- Launch Bash Beginning ----------------\n'
echo -e "\n...\e[32mUpdating system & Installing gh,curl,unzip,and python3-pip\e[m...\n"
type -p unzip >/dev/null || sudo apt install unzip -y
type -p python3-pip >/dev/null || sudo apt install python3-pip -y
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update -y \
&& sudo apt upgrade -y \
&& sudo apt install gh -y \
&& sudo apt install python3-pip -y
echo -e "\n...\e[32mUpdating system & Installing Packages Success\e[m...\n"

echo -e '---------- Login Processong ----------------\n'
echo -e "\n...\e[32mgh login\e[m...\n"
echo ${GITHUB_TOKEN} | gh auth login --with-token
echo -e "\n...\e[32mgh login Success\e[m...\n"

echo -e '---------- Activate extensiones ----------------\n'
echo -e "\n...\e[32mEnable jupyterlab extension\e[m...\n"
jupyter serverextension enable --py jupyterlab --sys-prefix

echo -e '---------- Show Info ----------------\n'
echo -e "\n\e[32mRAILWAY_STATIC_URL : \e[m $RAILWAY_STATIC_URL"
echo -e "\n\e[JUPYTERLAB_PASSWORD_PROTECT : \e[m $JUPYTERLAB_PASSWORD_PROTECT\n"

echo -e '---------- Start jupyter lab ----------------\n'
echo -e "\n...\e[32;1mjupyter lab Starting\e[m...\n"
sudo mkdir -p notebook && cd "$_" \
&& export JUPYTER_CONFIG_DIR=/app \
&& jupyter lab --port=${PORT} --allow-root
