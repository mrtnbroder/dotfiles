function rmnm --description="Remove node_modules directories recursively"
  find -E . -maxdepth 4 -regex ".*/(node_modules|\.turbo|dist|*\.tsbuildinfo)" -print0 | xargs -0 rm -rf
end
