-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
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
  UPPER(HEX(kem_ciphertext)) AS kem_ciphertext_hex,
  UPPER(HEX(encap_pubkey))   AS encap_pubkey_hex
FROM key_wrapper_layers;
