FROM hashicorp/terraform:latest

# Copy the SSH public key directly into the image
COPY .ssh/id_ed25519_hetzner.pub /root/.ssh/id_ed25519_hetzner.pub

# Fix permissions inside the container
RUN chmod 644 /root/.ssh/id_ed25519_hetzner.pub

ENTRYPOINT ["tail", "-f", "/dev/null"]