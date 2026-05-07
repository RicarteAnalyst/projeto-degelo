🧊 Projeto Degelo — Pipeline de Dados Ambientais
Dashboard analítico sobre a perda de massa de gelo na Antártida, utilizando dados do Our World in Data (IMBIE) de 2002 a 2020.

📌 Visão Geral
Este projeto tem como objetivo construir um pipeline de dados completo — da coleta até a visualização — para analisar a evolução do degelo na Antártida ao longo de quase duas décadas.

🏗️ Arquitetura
Fonte de Dados (Our World in Data)
        ↓
    Python (coleta)
        ↓
   Google BigQuery
  ┌─────────────────────────────┐
  │  Bronze → Silver → Gold     │
  └─────────────────────────────┘
        ↓
    dbt Cloud (transformações)
        ↓
   Looker Studio (dashboard)

🛠️ Tecnologias Utilizadas
TecnologiaFinalidadePythonColeta e ingestão de dadosGoogle BigQueryArmazém de dados em nuvemdbt CloudTransformação, testes e documentaçãoLooker StudioVisualização e dashboardGitHubVersionamento do código

📂 Estrutura do Projeto
projeto-degelo/
├── src/
│   ├── database.py          # Coleta de dados da web
│   ├── bigquery_upload.py   # Upload para o BigQuery
│   └── main.py              # Orquestrador do pipeline
├── data/
│   └── raw/
│       └── massa_gelo_antartida.csv
├── models/
│   ├── staging/
│   │   ├── stg_massa_gelo.sql
│   │   └── schema.yml
│   └── marts/
│       ├── fct_massa_gelo.sql
│       ├── dim_data.sql
│       ├── vw_tendencia_anual.sql
│       ├── vw_evolucao_acumulada.sql
│       ├── vw_piores_anos.sql
│       ├── vw_pior_ano.sql
│       ├── vw_meses_criticos.sql
│       ├── vw_taxa_variacao.sql
│       └── vw_ganho_gelo.sql
├── .env
├── requirements.txt
└── README.md

📊 Camadas de Dados
🟤 Bronze
Dados brutos ingeridos diretamente da fonte, sem transformações.
⚪ Silver
Dados limpos e tratados:

Conversão de tipos
Remoção de nulos
Padronização de colunas

🟡 Gold
Dados modelados em formato estrela (Star Schema):

fct_massa_gelo — tabela fato
dim_data — dimensão temporal
Views analíticas para o dashboard


📈 Análises do Dashboard

Evolução Acumulada — perda total de massa desde 2002
Tendência Anual — média de variação por ano
Piores Anos — ranking dos anos com maior perda
Meses Críticos — distribuição do derretimento por mês
Taxa de Variação — aceleração ou desaceleração da perda
Pior Ano — ano com maior perda registrada


⚙️ Como Executar
Pré-requisitos

Python 3.10+
Conta no Google Cloud com BigQuery habilitado
Arquivo credentials.json do Google Cloud

Instalação
bashgit clone https://github.com/RicarteAnalyst/projeto-degelo.git
cd projeto-degelo
pip install -r requirements.txt
Configurar variáveis de ambiente
Crie um arquivo .env na raiz do projeto:
envBASE_URL=https://ourworldindata.org/grapher/ice-sheet-mass-balance.csv
API_KEY=sua_chave
GOOGLE_APPLICATION_CREDENTIALS=credentials.json
Executar o pipeline
bashpython src/main.py

🧪 Testes de Qualidade (dbt)
Os seguintes testes foram configurados com dbt:

not_null nas colunas Data, Entidade e Variacao_Sazonal
Garantia de integridade dos dados na camada Silver


📡 Fonte dos Dados

Our World in Data / IMBIE — Ice Sheet Mass Balance Inter-comparison Exercise
Período: 2002 a 2020
Região: Antártida


👤 Autor
Nicollas Ricarte
