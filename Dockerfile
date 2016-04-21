# Pull base image
FROM node:0.12.7

# Install Aglio
RUN npm install -g aglio@latest


# We need /bin/sh instead of aglio itself as the entrypoint so the
# container can correctly interpret signals such as SIGINT. In the
# original Dockerfile, a Ctrl-C didn't interrupt the process, so we're
# forking the project so we can introduce this change.
ENTRYPOINT ["/bin/sh", "-c"]
