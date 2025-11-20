# 📦 Key Wrapper Layers

![SQL](https://img.shields.io/badge/SQL-MySQL%208.0%2B-4479A1?logo=mysql&logoColor=white) ![License](https://img.shields.io/badge/license-BlackCat%20Proprietary-red) ![Status](https://img.shields.io/badge/status-stable-informational) ![Generated](https://img.shields.io/badge/generated-from%20schema--map-blue)

<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->

> Schema package for table **key_wrapper_layers** (repo: `key-wrapper-layers`).

## Files
```
schema/
  001_table.sql
  020_indexes.sql
  030_foreign_keys.sql
```

## Quick apply
```bash
# Apply schema (Linux/macOS):
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/001_table.sql
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/020_indexes.sql
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/030_foreign_keys.sql
```

```powershell
# Apply schema (Windows PowerShell):
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/001_table.sql
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/020_indexes.sql
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/030_foreign_keys.sql
```

## Docker quickstart
```bash
# Spin up a throwaway MySQL and apply just this package:
docker run --rm -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=app -p 3307:3306 -d mysql:8
sleep 15
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/001_table.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/020_indexes.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/030_foreign_keys.sql
```

## Columns
| Column | Type | Null | Default | Extra |
|-------:|:-----|:----:|:--------|:------|
| id | BIGINT | — | AS | PK |
| key_wrapper_id | BIGINT | NO | — |  |
| layer_no | SMALLINT | NO | — |  |
| kms_key_id | BIGINT | YES | — |  |
| kem_algo_id | BIGINT | NO | — |  |
| kem_ciphertext | BYTEA | NO | — |  |
| encap_pubkey | BYTEA | YES | — |  |
| aad | JSONB | YES | — |  |
| meta | JSONB | YES | — |  |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) |  |

## Relationships
- FK → **crypto_algorithms** via (kem_algo_id) (ON DELETE RESTRICT).
- FK → **key_wrappers** via (key_wrapper_id) (ON DELETE CASCADE).
- FK → **kms_keys** via (kms_key_id) (ON DELETE SET NULL).

```mermaid
erDiagram
  KEY_WRAPPER_LAYERS {
    INT id PK
    INT key_wrapper_id
    INT layer_no
    INT kms_key_id
    INT kem_algo_id
    BYTEA kem_ciphertext
    BYTEA encap_pubkey
    JSONB aad
    JSONB meta
    TIMESTAMPTZ created_at
  }
  KEY_WRAPPER_LAYERS }o--|| CRYPTO_ALGORITHMS : "kem_algo_id"
  KEY_WRAPPER_LAYERS }o--|| KEY_WRAPPERS : "key_wrapper_id"
  KEY_WRAPPER_LAYERS }o--|| KMS_KEYS : "kms_key_id"
```

## Indexes
- 2 deferred index statement(s) in schema/020_indexes.sql.

## Notes
- Generated from the umbrella repository **blackcat-database** using `scripts/schema-map.psd1`.
- To change the schema, update the map and re-run the generators.

## License
Distributed under the **BlackCat Store Proprietary License v1.0**. See `LICENSE`.
