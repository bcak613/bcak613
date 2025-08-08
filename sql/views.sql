-- Bán theo tháng
CREATE OR REPLACE VIEW marts_v_monthly_sales AS
SELECT date_trunc('month', txn_date)::date AS month,
       sku,
       SUM(qty_kg) AS qty_kg,
       SUM(revenue) AS revenue
FROM stage_fact_sales
GROUP BY 1,2;

-- Tồn cuối tháng
CREATE OR REPLACE VIEW marts_v_monthly_inventory AS
SELECT date_trunc('month', snap_date)::date AS month,
       sku,
       SUM(on_hand_kg) AS on_hand_kg,
       SUM(in_transit_kg) AS in_transit_kg
FROM stage_fact_inventory
GROUP BY 1,2;
