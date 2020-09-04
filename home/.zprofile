# .zprofile

# linuxbrew
if [[ -f $HOME/.linuxbrew ]]; then
    eval $(~/.linuxbrew/bin/brew shellenv)
elif [[ -f /home/linuxbrew/.linuxbrew ]]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi