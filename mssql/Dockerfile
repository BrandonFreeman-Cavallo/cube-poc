FROM mcr.microsoft.com/mssql/server:2022-latest

ENV MSSQL_SA_PASSWORD=superSecurePassword123
ENV ACCEPT_EULA=Y

USER root

COPY ingest.bak /var/opt/mssql/data/ingest.bak
RUN chown -R mssql:root /var/opt/mssql/data && \
    chmod 0755 /var/opt/mssql/data && \
    chmod -R 0650 /var/opt/mssql/data/*

COPY *.sql /var/opt/mssql/files/
RUN chown -R mssql:root /var/opt/mssql/files && \
    chmod 0755 /var/opt/mssql/files && \
    chmod -R 0650 /var/opt/mssql/files/*

USER mssql

RUN (/opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Server is listening on" && sleep 2 && \
    /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $MSSQL_SA_PASSWORD -Q "RESTORE DATABASE [Ingest] FROM DISK = '/var/opt/mssql/data/ingest.bak'  WITH MOVE 'GPSTWODat.mdf' TO '/var/opt/mssql/data/TWO.mdf', MOVE 'GPSTWOLog.ldf' TO '/var/opt/mssql/data/ingest.ldf'" && \
    /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $MSSQL_SA_PASSWORD -i "/var/opt/mssql/files/SOPJOIN.sql" && \
    /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $MSSQL_SA_PASSWORD -i "/var/opt/mssql/files/SOPLINEJOIN.sql" && \
    /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $MSSQL_SA_PASSWORD -i "/var/opt/mssql/files/SOP_Transfers.sql" && \
    /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $MSSQL_SA_PASSWORD -i "/var/opt/mssql/files/SOP_Recombine.sql" && \
    /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $MSSQL_SA_PASSWORD -i "/var/opt/mssql/files/SOPVIEW_SalesPad_FINAL.sql" && \
    /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $MSSQL_SA_PASSWORD -i "/var/opt/mssql/files/KPIs.sql"
