FROM hashicorp/packer:latest
LABEL Author="Animesh Rastogi"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]