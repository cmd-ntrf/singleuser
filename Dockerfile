# Build as jupyterhub/singleuser
# Run with the DockerSpawner in JupyterHub

ARG BASE_IMAGE=jupyter/base-notebook
FROM $BASE_IMAGE
MAINTAINER Project Jupyter <jupyter@googlegroups.com>

ADD install_jupyterhub /tmp/install_jupyterhub
ARG JUPYTERHUB_VERSION=0.9.*
# install pinned jupyterhub and ensure notebook is installed
RUN python3 /tmp/install_jupyterhub && \
    python3 -m pip install notebook

ARG JUPYTERLAB_VERSION=0.33.6
RUN     pip install jupyterlab==$JUPYTERLAB_VERSION \
    &&  jupyter labextension install @jupyterlab/hub-extension
