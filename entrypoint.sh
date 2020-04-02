# entrypoint.sh
#!/bin/bash

set -e

export JUPYTERHUB_RUNTIME_DIR=/srv/jupyterhub
export JUPYTERHUB_CONFIG_FILE=jupyterhub_config.py

jupyterhub -f ${JUPYTERHUB_RUNTIME_DIR}/${JUPYTERHUB_CONFIG_FILE}