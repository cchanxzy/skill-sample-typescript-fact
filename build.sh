#!/bin/sh

echo "==================== Running Build Script  ===================="

# Remove lambda directory
echo " >> Removing lambda directory"
rm -rf lambda 

# Compile code with TypeScript
echo " >> Compiling code with TypeScript"
tsc

# Copy package.json to new lambda dir
echo " >> Copying package.json and yarn.lock"
cp package.json lambda/package.json
cp yarn.lock lambda/yarn.lock

# Install only production packages
echo " >> Installing production only packages"
cd lambda && yarn install --production && cd ../