-- Auto-generated from schema-views-postgres.yaml (map@4ae85c5)
-- engine: postgres
-- table:  key_wrapper_layers

-- Contract view for [key_wrapper_layers]
-- Hides ciphertexts; exposes hex helpers.
CREATE OR REPLACE VIEW vw_key_wrapper_layers AS
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
  UPPER(encode(digest(kem_ciphertext,'sha256'),'hex'))::char(64) AS kem_ciphertext_hex,
  UPPER(encode(digest(encap_pubkey,'sha256'),'hex'))::char(64)   AS encap_pubkey_hex
FROM key_wrapper_layers;
