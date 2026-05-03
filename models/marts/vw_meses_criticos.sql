SELECT
  MIN(Variacao_Sazonal) AS Maior_Derretimento,
  d.Mes,
  d.Nome_Mes
FROM {{ ref('fct_massa_gelo')}} f
INNER JOIN {{ ref('dim_data')}} d ON f.Data = d.Data
GROUP BY d.Mes, d.Nome_Mes
ORDER BY d.Mes, d.Nome_Mes