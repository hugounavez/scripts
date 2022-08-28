#!/bin/bash
echo "Installing script";

# installing homebrew

echo "Installing homebrew..";
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";

echo "Success installing homebrew";

# setting path of visual studio code
cd ~/;
touch .bash_profile;

# Install pip python dependencies
echo "Install pip python";

# No need to install python pip because it is already included 
# python3 -m pip install --upgrade pip


echo "Add Visual Studio Code path";
#cat << EOF >> ~/.bash_profile

#export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

#EOF

#echo "Success adding Visual Studio Code path";

# Once the installation process is complete, we will put the Homebrew directory at the top of the PATH
# environment variable. This will ensure that Homebrew installations will be called over the tools that macOS may
# select automatically that could run counter to the development environment we are creating.

#cat << EOF >> ~/.bash_profile

#export PATH="/usr/local/bin:\$PATH"

#EOF

source ~/.bash_profile;

brew update;

echo "Install golang";
brew install golang;


# The -p option tells mkdir to create all parents in the directory, even if they don’t currently exist. Using
# {bin,src} creates a set of arguments to mkdir and tells it to create both the bin directory and the src
# directory.
mkdir -p $HOME/go/{bin,src};

# Prior to Go 1.8, it was required to set a local environment variable called $GOPATH. While it is no longer
# explicitly required to do so, it is still considered a good practice as many third party tools still depend on this
# variable being set.

cat << EOF >> ~/.bash_profile

export GOPATH="\$HOME/go"

EOF

cat << EOF >> ~/.bash_profile

export PATH="\$PATH:\$GOPATH/bin"

EOF

