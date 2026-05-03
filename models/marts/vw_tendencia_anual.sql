SELECT 
  AVG(Variacao_Sazonal) AS Tendencia,
  d.Ano AS Ano
FROM {{ ref('fct_massa_gelo')}} f
INNER JOIN {{ ref('dim_data')}} d ON f.Data = d.Data
GROUP BY d.Ano