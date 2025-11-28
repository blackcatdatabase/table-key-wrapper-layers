-- Auto-generated from schema-map-mysql.psd1 (map@mtime:2025-11-27T15:13:14Z)
-- engine: mysql
-- table:  key_wrapper_layers

CREATE INDEX idx_kwl_kw ON key_wrapper_layers (key_wrapper_id);

CREATE INDEX idx_kwl_algo ON key_wrapper_layers (kem_algo_id);
