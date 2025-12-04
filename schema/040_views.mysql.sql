-- Auto-generated from schema-views-mysql.yaml (map@4ae85c5)
-- engine: mysql
-- table:  key_wrapper_layers

-- Contract view for [key_wrapper_layers]
-- Hides ciphertexts; exposes hex helpers.
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_key_wrapper_layers AS
SELECT
  id,
  key_wrapper_id,
  layer_no,
  kms_key_id,
  kem_algo_id,
  aad,
  meta,
  created_at,
  kem_ciphertext,
  encap_pubkey,
  CAST(UPPER(SHA2(kem_ciphertext, 256)) AS CHAR(64)) AS kem_ciphertext_hex,
  CAST(UPPER(SHA2(encap_pubkey, 256))   AS CHAR(64)) AS encap_pubkey_hex
FROM key_wrapper_layers;
