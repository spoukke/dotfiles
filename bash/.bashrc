# Run zsh
if [ "$SHELL" != "/usr/bin/zsh" ]
then
    export SHELL="/usr/bin/zsh"
    exec /usr/bin/zsh
fi
