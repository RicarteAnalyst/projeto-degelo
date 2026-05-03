SELECT
  AVG(f.Variacao_Sazonal) AS Evolucao_Acumulada,
  d.Ano
FROM {{ ref('fct_massa_gelo') }} f
INNER JOIN {{ ref('dim_data') }} d ON f.Data = d.Data
GROUP BY d.Ano
ORDER BY d.Ano