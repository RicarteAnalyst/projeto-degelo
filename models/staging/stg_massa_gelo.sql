SELECT
    Entidade,
    Codigo,
    Variacao_Sazonal,
    Data
FROM {{ source('silver_nasa_data', 'massa_gelo') }}