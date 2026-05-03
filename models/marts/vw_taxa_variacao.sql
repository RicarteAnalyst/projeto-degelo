WITH media_por_ano AS (
  SELECT
    AVG(Variacao_Sazonal) AS Media_Variacao,
    EXTRACT(YEAR FROM Data) AS Ano
  FROM `projeto-degelo.gold_nasa_data.fct_massa_gelo`
  GROUP BY Ano
)
SELECT
  Ano,
  Media_Variacao,
  LAG(Media_Variacao) OVER (ORDER BY Ano) AS Variacao_Ano_Anterior,
  Media_Variacao - LAG(Media_Variacao) OVER (ORDER BY Ano) AS Diferenca
FROM media_por_ano
ORDER BY Ano