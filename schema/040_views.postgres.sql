-- Auto-generated from schema-views-postgres.psd1 (map@9d3471b)
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
  UPPER(encode(kem_ciphertext,''hex'')) AS kem_ciphertext_hex,
  UPPER(encode(encap_pubkey,''hex''))   AS encap_pubkey_hex
FROM key_wrapper_layers;
