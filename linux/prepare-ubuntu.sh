sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y install oracle-java7-installer oracle-jdk7-installer
sudo apt-get -y install unity-tweak-tool build-essential clang-3.4 clang-3.4-doc cmake mercurial vim ruby2.0 ruby2.0-doc libx11-dev libgl1-mesa-dev libsqlite3-dev sqlite3 tree

# android studio support
sudo apt-get -y install lib32ncurses5

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get -y install google-chrome-stable


sudo apt-get update
sudo apt-get -y upgrade

