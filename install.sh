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

today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.vimrc.bundles; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.vimrc.bundles; do [ -L $i ] && unlink $i ; done

echo "------------------------------------"
echo "Step2: setting up symlinks"
lnif $CURRENT_DIR/vimrc $HOME/.vimrc
#lnif $CURRENT_DIR/vimrc.bundles $HOME/.vimrc.bundles
lnif "$CURRENT_DIR/" "$HOME/.vim"


echo "------------------------------------"
echo "Step3: install pathogen"

#cd $HOME/.vim/bundle
#git clone https://github.com/tpope/vim-pathogen.git
mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle && \
curl -LSso $HOME/.vim/bundle/pathogen/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "------------------------------------"
echo "Step4: clone plugins from github"

cd $HOME/.vim/bundle
while read -r line
do
    link=`echo $line | cut -d" " -f2`
    git clone $link
done < "pluginList"

echo "Step5: compile YouCompleteMe"


echo "Install Done"
