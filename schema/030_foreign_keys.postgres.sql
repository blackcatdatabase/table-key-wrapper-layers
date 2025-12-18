-- Auto-generated from schema-map-postgres.yaml (map@sha1:621FDD3D99B768B6A8AD92061FB029414184F4B3)
-- engine: postgres
-- table:  key_wrapper_layers

ALTER TABLE key_wrapper_layers ADD CONSTRAINT fk_kwl_kw   FOREIGN KEY (key_wrapper_id) REFERENCES key_wrappers(id) ON DELETE CASCADE;

ALTER TABLE key_wrapper_layers ADD CONSTRAINT fk_kwl_kms  FOREIGN KEY (kms_key_id)     REFERENCES kms_keys(id) ON DELETE SET NULL;

ALTER TABLE key_wrapper_layers ADD CONSTRAINT fk_kwl_algo FOREIGN KEY (kem_algo_id)    REFERENCES crypto_algorithms(id) ON DELETE RESTRICT;
