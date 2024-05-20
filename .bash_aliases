alias shrink="export PS1='> '"
alias android_gdb="/home/ubuntu/android-ndk-r10e/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-gdb"
alias env_py="source ~/env/bin/activate"
alias c="clear"
alias pbcopy="xclip -sel clip"
alias set_dev="source ~/scripts/set_default_device"
alias set_Dev="source ~/scripts/set_default_device"
alias set_DEv="source ~/scripts/set_default_device"
alias sd="source ~/scripts/set_default_device"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias device='device'
alias edit='fd --hidden | fzf-tmux -p --reverse | xargs -r nvim'
ars() {
    adb shell "su -c '$1'"
}
