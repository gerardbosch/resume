
#!/bin/bash
#
# This build script is intended for Netlify to publish the us-resume branch - GitHub does not
# support multiple branch deployments :'(
#

# Exit immediately if a command exits with a non-zero status
set -e

# Extract Docker image from the GitHub workflow to avoid inconsistencies
DOCKER_IMAGE=$(grep -oP "docker_image:\s*'\K[^']+" '.github/workflows/compile.yml')

mkdir -p build

# Compile the LaTeX document
docker run --rm -v "$(pwd)":/workspace -w /workspace "$DOCKER_IMAGE" latexmk

# Log built files
echo 'Files in the build dir:'
echo '======================='
ls -la build

