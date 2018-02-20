#!/bin/bash
 
# helper functions
prepend() {
    # usage: prepend "some text" file
    #   prepends the given text to the beginning of the file
    echo "$1\n$(cat $2)" > $2
}
 
# install oh my zsh and set zsh as default shell
sudo apt install -y zsh curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)
 
# audio recorder
sudo apt install -y pulseaudio-utils lame mpg123
stereo_out=`pacmd list-sources | grep -oPe "alsa.*monitor"`
# usage: recordaudio out.mp3
echo "alias recordaudio=\"parec -d ${stereo_out} | lame -r -V0 - \"" >> ~/.zshrc
# alternative:
# echo "alias recordaudio=\"parec -d ${stereo_out} --file-format=ogg \"" >> ~/.zshrc
