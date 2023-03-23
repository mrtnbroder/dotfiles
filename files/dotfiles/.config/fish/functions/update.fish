function update --description 'Get OS X Software Updates and update Homebrew, mas, and npm packages'
  softwareupdate -ai
  brew update
  brew upgrade
  brew cleanup
  mas upgrade
  pip install --upgrade pip
  npm install npm -g
  npm update -g
end
