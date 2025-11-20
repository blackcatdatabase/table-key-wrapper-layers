-- Auto-generated from schema-map-postgres.psd1 (map@62c9c93)
-- engine: postgres
-- table:  key_wrapper_layers
CREATE INDEX IF NOT EXISTS idx_kwl_kw ON key_wrapper_layers (key_wrapper_id);

CREATE INDEX IF NOT EXISTS idx_kwl_algo ON key_wrapper_layers (kem_algo_id);
