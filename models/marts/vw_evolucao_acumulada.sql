SELECT
  SUM(Variacao_Sazonal) OVER (ORDER BY d.Ano) AS Evolucao_Acumulada,
  d.Ano
FROM {{ ref('fct_massa_gelo') }} f
INNER JOIN {{ ref('dim_data') }} d ON f.Data = d.Data