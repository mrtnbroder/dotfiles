function rmnm --description="Remove node_modules directories recursively"
    find -E . -maxdepth 5 -regex ".*/(node_modules|\.turbo|storybook-static|build|dist|.*\.(tmp|log|tsbuildinfo|svelte-kit))|(.*\.ts\.timestamp.*)" -print0 | xargs -0 rm -rf
end
