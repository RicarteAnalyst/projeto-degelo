SELECT
  AVG(Variacao_Sazonal) AS Evolucao_Acumulada,
  EXTRACT(YEAR FROM Data) AS Ano
FROM {{ ref('fct_massa_gelo') }}
GROUP BY Ano
ORDER BY Ano