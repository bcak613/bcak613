# Seasonal Purchase Planner POC

This repository provides a minimal proof-of-concept environment for exploring ERP data and building quick reports using Postgres, Adminer, and Metabase. Follow the steps below to spin up the stack and create the necessary schemas, tables, and views.

## 1. Start the stack

```bash
docker compose up -d
```

Services:

- **Postgres**: exposed on `5432`, credentials `planner` / `planner`, database `erp`
- **Adminer**: <http://localhost:8080>
- **Metabase**: <http://localhost:3000>

## 2. Create schemas and tables

Use Adminer to connect to Postgres and run the SQL from [`sql/schema.sql`](sql/schema.sql):

```sql
\i sql/schema.sql
```

You can also import CSV files directly into the `stage_*` tables from the Adminer interface.

Sample data must match the table headers. Prepare or obtain CSV files with the following column names:

- `dim_product.csv`: `sku,fruit,variety,size,label,grade,origin`
- `sales_2024.csv`: `txn_date,sku,qty_kg,revenue,channel`
- `inventory_2024.csv`: `snap_date,sku,on_hand_kg,in_transit_kg`

These templates are not included in the repository. Request them from the maintainers or create your own using the headers above.

## 3. Create BI views

Run the SQL in [`sql/views.sql`](sql/views.sql) to generate the summary views for monthly sales and inventory:

```sql
\i sql/views.sql
```

## 4. Connect Metabase

In Metabase, add a new PostgreSQL database with:

- Host: `postgres`
- Database: `erp`
- User: `planner`
- Password: `planner`

Create dashboards or charts such as monthly quantity sold and ending inventory.

## 5. (Optional) React prototype

A placeholder directory `app/` can host a React prototype. Install Node LTS, then:

```bash
cd app
npm install
npm run dev
```

The UI currently uses mocked data; future steps can connect it to real APIs.

