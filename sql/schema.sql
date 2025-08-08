CREATE SCHEMA IF NOT EXISTS stage;
CREATE SCHEMA IF NOT EXISTS marts;

-- Master/Product
CREATE TABLE IF NOT EXISTS stage_dim_product (
  sku TEXT PRIMARY KEY,
  fruit TEXT,
  variety TEXT,
  size TEXT,
  label TEXT,
  grade TEXT,
  origin TEXT
);

-- Sales fact (ngày)
CREATE TABLE IF NOT EXISTS stage_fact_sales (
  txn_date DATE,
  sku TEXT REFERENCES stage_dim_product(sku),
  qty_kg NUMERIC,
  revenue NUMERIC,
  channel TEXT
);

-- Purchase fact (PO/GRN)
CREATE TABLE IF NOT EXISTS stage_fact_purchase (
  po_date DATE,
  grn_date DATE,
  sku TEXT REFERENCES stage_dim_product(sku),
  supplier TEXT,
  qty_kg NUMERIC,
  unit_cost NUMERIC
);

-- Inventory snapshot (cuối ngày/tháng)
CREATE TABLE IF NOT EXISTS stage_fact_inventory (
  snap_date DATE,
  sku TEXT REFERENCES stage_dim_product(sku),
  on_hand_kg NUMERIC,
  in_transit_kg NUMERIC
);
