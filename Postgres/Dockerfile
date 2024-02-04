FROM postgres:16.1

# Use sed to set max_connections in postgresql.conf
#RUN sed -i 's/^#max_connections = 100/max_connections = 250/' /usr/share/postgresql/postgresql.conf.sample
#RUN sed -i 's/^#max_connections = 100/max_connections = 250/' /usr/share/postgresql/16/postgresql.conf.sample
#RUN sed -i 's/^#max_connections = 100/max_connections = 250/' /usr/share/postgresql/16/postgresql.conf.sample
ADD entrypoint/max_connections.sql /docker-entrypoint-initdb.d/max_conns.sql