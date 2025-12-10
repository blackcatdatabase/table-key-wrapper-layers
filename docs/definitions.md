# key_wrapper_layers

Individual layers that compose a key wrapper.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| aad | mysql: JSON / postgres: JSONB | YES |  | JSON AAD metadata used during wrapping. |
| created_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| encap_pubkey | mysql: LONGBLOB / postgres: BYTEA | YES |  | Optional encapsulated public key. |
| id | BIGINT | NO |  | Surrogate primary key. |
| kem_algo_id | BIGINT | NO |  | KEM algorithm used for wrapping (FK crypto_algorithms.id). |
| kem_ciphertext | mysql: LONGBLOB / postgres: BYTEA | NO |  | Ciphertext blob for the wrapped key material. |
| key_wrapper_id | BIGINT | NO |  | Parent key wrapper (FK key_wrappers.id). |
| kms_key_id | BIGINT | YES |  | KMS key used for the layer, if any. |
| layer_no | SMALLINT | NO |  | Layer order (1..N). |
| meta | mysql: JSON / postgres: JSONB | YES |  | Additional JSON metadata. |

## Engine Details

### mysql

Unique keys:
| Name | Columns |
| --- | --- |
| uq_kwl | key_wrapper_id, layer_no |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_kwl_algo | kem_algo_id | CREATE INDEX idx_kwl_algo ON key_wrapper_layers (kem_algo_id) |
| idx_kwl_kw | key_wrapper_id | CREATE INDEX idx_kwl_kw ON key_wrapper_layers (key_wrapper_id) |
| uq_kwl | key_wrapper_id,layer_no | UNIQUE KEY uq_kwl (key_wrapper_id, layer_no) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_kwl_algo | kem_algo_id | crypto_algorithms(id) | ON DELETE RESTRICT |
| fk_kwl_kms | kms_key_id | kms_keys(id) | ON DELETE SET |
| fk_kwl_kw | key_wrapper_id | key_wrappers(id) | ON DELETE CASCADE |

### postgres

Unique keys:
| Name | Columns |
| --- | --- |
| uq_kwl | key_wrapper_id, layer_no |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_kwl_algo | kem_algo_id | CREATE INDEX IF NOT EXISTS idx_kwl_algo ON key_wrapper_layers (kem_algo_id) |
| idx_kwl_kw | key_wrapper_id | CREATE INDEX IF NOT EXISTS idx_kwl_kw ON key_wrapper_layers (key_wrapper_id) |
| uq_kwl | key_wrapper_id,layer_no | CONSTRAINT uq_kwl UNIQUE (key_wrapper_id, layer_no) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_kwl_algo | kem_algo_id | crypto_algorithms(id) | ON DELETE RESTRICT |
| fk_kwl_kms | kms_key_id | kms_keys(id) | ON DELETE SET |
| fk_kwl_kw | key_wrapper_id | key_wrappers(id) | ON DELETE CASCADE |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_key_wrapper_layers | mysql | algorithm=MERGE, security=INVOKER | [../schema/040_views.mysql.sql](../schema/040_views.mysql.sql) |
| vw_key_wrapper_layers | postgres |  | [../schema/040_views.postgres.sql](../schema/040_views.postgres.sql) |
