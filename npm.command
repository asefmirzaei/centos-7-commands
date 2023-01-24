# first install node.js
npm i -g npm@latest

# check npm and node.js issues :
npm doctor

# clear cache : 
npm cache clear --force
npm cache rm --force
npm cache verify

# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# For : Error: error:0308010C:digital envelope routines::unsupported
# 👇️ for macOS, Linux or Windows Git Bash
export NODE_OPTIONS=--openssl-legacy-provider
# 👇️ for Windows CMD (Command Prompt)
set NODE_OPTIONS=--openssl-legacy-provider
# 👇️ for Windows PowerShell
$env:NODE_OPTIONS="--openssl-legacy-provider"
# 👇️ for Docker (in your Dockerfile)
ENV NODE_OPTIONS="--openssl-legacy-provider"

# Read this article :  https://bobbyhadz.com/blog/react-error-digital-envelope-routines-unsupported
# ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
