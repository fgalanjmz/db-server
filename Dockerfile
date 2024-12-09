# Use the official Microsoft SQL Server Express 2022 image
FROM csadmin01/cs360-db:v1

# Para terminar la configuracion
# /opt/mssql/bin/mssql-conf setup

# Set environment variables
ENV ACCEPT_EULA=Y
ENV MSSQL_SA_PASSWORD=Adm1nCS360
ENV MSSQL_PID=Express

# Expose SQL Server port
EXPOSE 1433

# Update Path for login sessions
RUN echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bash_profile
# RUN source ~/.bash_profile

# Update Path for no-login sessions
RUN echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
# RUN source ~/.bashrc

# Complete configuration
# RUN /opt/mssql/bin/mssql-conf setup

# Run SQL Server
ENTRYPOINT ["/opt/mssql/bin/sqlservr"]
