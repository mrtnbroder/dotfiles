
function npmc --description "alias for a clean node package installation"
  rm -rf node_modules
  npm cache clear
  npm run build
end
