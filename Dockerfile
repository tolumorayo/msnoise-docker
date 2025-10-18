# Start from the official Jupyter SciPy Notebook image
FROM jupyter/scipy-notebook:latest

# Switch to the root user to install system packages and create directories
USER root

# Use conda to install the main dependencies from conda-forge
RUN conda install --quiet --yes -c conda-forge \
    'obspy' \
    'flask-admin' \
    'flask-wtf' \
    'markdown' \
    'folium' \
    'pymysql' \
    'logbook' \
    && conda clean --all -f -y

# Use pip to install the main application
RUN pip install --no-cache-dir msnoise

# Switch back to the standard, unprivileged jovyan user
USER ${NB_UID}
