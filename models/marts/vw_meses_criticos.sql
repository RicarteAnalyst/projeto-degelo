SELECT
  ABS(MIN(Variacao_Sazonal)) AS Maior_Derretimento,
  Mes,
  Nome_Mes
FROM `projeto-degelo.gold_nasa_data.fct_massa_gelo` f
INNER JOIN `projeto-degelo.gold_nasa_data.dim_data` d ON f.Data = d.Data
GROUP BY Mes, Nome_Mes
ORDER BY Mes, Nome_Mes