SELECT
  Variacao_Sazonal,
  d.Ano
FROM {{ ref('fct_massa_gelo')}} f
INNER JOIN {{ ref('dim_data')}} d ON f.Data = d.Data
WHERE Variacao_Sazonal > 0
