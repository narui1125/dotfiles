
# Tokyo Tech Login
if [ -f "${HOME}/.secrets/tokyotechauth" ]; then
    curl -X POST --ciphers AES256-SHA -d @${HOME}/.secrets/tokyotechauth https://wlanauth.noc.titech.ac.jp/login.html
    /usr/bin/osascript -e 'display notification "ログインしました" with title "Tokyo Tech"'
fi