SELECT DISTINCT
    Data,
    EXTRACT(YEAR FROM Data) AS Ano,
    EXTRACT(MONTH FROM Data) AS Mes,
    EXTRACT(DAY FROM Data) AS Dia,
    FORMAT_DATE('%B', Data) AS Nome_Mes
FROM {{ ref('stg_massa_gelo') }}