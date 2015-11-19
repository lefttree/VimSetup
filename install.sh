#!/bin/bash

BASEDIR=$(dirname $0)
cd $BASEDIR
CURRENT_DIR=`pwd`

lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
}

echo "------------------------------------"
echo "Step1: backing up current vim config"
echo "------------------------------------"

today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.vimrc.bundles; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.vimrc.bundles; do [ -L $i ] && unlink $i ; done

echo "------------------------------------"
echo "Step2: copy color theme and setting up symlinks for vimrc"
echo "------------------------------------"
if [ ! -e $HOME/.vim ]; then
    mkdir -p $HOME/.vim
fi
cp -r $CURRENT_DIR/colors $HOME/.vim/colors
lnif $CURRENT_DIR/vimrc $HOME/.vimrc
#lnif $CURRENT_DIR/vimrc.bundles $HOME/.vimrc.bundles
#lnif "$CURRENT_DIR/" "$HOME/.vim"

echo "------------------------------------"
echo "Step3: install pathogen"
echo "------------------------------------"

#cd $HOME/.vim/bundle
#git clone https://github.com/tpope/vim-pathogen.git
mkdir -p $HOME/.vim/bundle
cd $HOME/.vim/bundle
git clone https://github.com/tpope/vim-pathogen.git
cd -

echo "------------------------------------"
echo "Step4: clone plugins from github"
echo "------------------------------------"

while read -r line
do
    link=`echo $line | cut -d" " -f2`
    #dirName=`echo $link | sed -n 's/^.*\/\(.*\).git$/\1/g'`
    cd $HOME/.vim/bundle && git clone $link
done < "pluginList"
cd -

echo "------------------------------------"
echo "Step5: compile YouCompleteMe"
echo "------------------------------------"
echo "It will take a long time, just be patient!"
echo "If error, please compile it yourself"
cd $HOME/.vim/bundle && git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe && git submodule update --init --recursive && ./install.py --clang-completer

echo "------------------------------------"
echo "Installation Done!"
echo ""
echo "Plugins you need to install by yourself:"
echo "  1. pyflakes - need to install flake8 package"
echo "  2. tagbar   - need ctags"
echo "  3. tag list - need ctags"
echo "  4. ultisnips"
echo "  5. DoxygenTooklit"
echo "------------------------------------"
