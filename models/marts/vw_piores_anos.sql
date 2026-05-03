SELECT
  MIN(Variacao_Sazonal) AS Perda_Gelo,
  d.Ano
FROM {{ ref('fct_massa_gelo')}} f
INNER JOIN {{ ref('dim_data')}} d ON f.Data = d.Data
GROUP BY d.Ano
ORDER BY d.Ano 