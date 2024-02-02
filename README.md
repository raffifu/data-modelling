# Data Modelling and Analytics
Data modelling analytics using postgres and dbt

## How to run
1. Deploy postgresql
```sh
docker compose -f docker-compose.yaml -d
```
2. Install dbt postgres
```sh
pip3 install dbt-postgres
```
3. Ingest the data
using psql
```sh
psql -1 -U user -d employee -h localhost -W -a -f ingest_data.sql
```
Using dbt
```sh
cd cofee_shop
dbt run
```
4. Run dbt
```sh
cd cofee_shop
dbt run
```