-- Auto-generated from schema-map-mysql.yaml (map@sha1:7AAC4013A2623AC60C658C9BF8458EFE0C7AB741)
-- engine: mysql
-- table:  key_wrapper_layers

CREATE INDEX idx_kwl_kw ON key_wrapper_layers (key_wrapper_id);

CREATE INDEX idx_kwl_algo ON key_wrapper_layers (kem_algo_id);
