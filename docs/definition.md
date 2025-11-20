<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – key_wrapper_layers

Individual layers that compose a key wrapper.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| key_wrapper_id | BIGINT | NO | — | Parent key wrapper (FK key_wrappers.id). |  |
| layer_no | SMALLINT | NO | — | Layer order (1..N). |  |