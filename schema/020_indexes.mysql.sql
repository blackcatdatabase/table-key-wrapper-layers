-- Auto-generated from schema-map-mysql.yaml (map@sha1:0D716345C0228A9FD8972A3D31574000D05317DB)
-- engine: mysql
-- table:  key_wrapper_layers

CREATE INDEX idx_kwl_kw ON key_wrapper_layers (key_wrapper_id);

CREATE INDEX idx_kwl_algo ON key_wrapper_layers (kem_algo_id);
