SELECT
  LAG(Variacao_Sazonal) OVER(ORDER BY d.Ano) AS Variacao_por_Ano,
  d.Ano
  FROM {{ ref('fct_massa_gelo')}} f
INNER JOIN {{ ref('dim_data')}} d ON f.Data = d.Data