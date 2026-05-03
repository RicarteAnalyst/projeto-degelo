SELECT
    Entidade,
    Codigo,
    Variacao_Sazonal,
    Data
FROM {{ ref('stg_massa_gelo') }}