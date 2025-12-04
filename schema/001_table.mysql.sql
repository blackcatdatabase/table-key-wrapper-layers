-- Auto-generated from schema-map-mysql.yaml (map@74ce4f4)
-- engine: mysql
-- table:  key_wrapper_layers

CREATE TABLE IF NOT EXISTS key_wrapper_layers (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  key_wrapper_id BIGINT UNSIGNED NOT NULL,
  layer_no SMALLINT UNSIGNED NOT NULL,
  kms_key_id BIGINT UNSIGNED NULL,
  kem_algo_id BIGINT UNSIGNED NOT NULL,
  kem_ciphertext LONGBLOB NOT NULL,
  encap_pubkey LONGBLOB NULL,
  aad JSON NULL,
  meta JSON NULL,
  created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  UNIQUE KEY uq_kwl (key_wrapper_id, layer_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
