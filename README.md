<div align="center">

# 🧊 Projeto Degelo
### Pipeline de Dados Ambientais — Antártida (2002–2020)

[![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://python.org)
[![BigQuery](https://img.shields.io/badge/BigQuery-4285F4?style=for-the-badge&logo=google-cloud&logoColor=white)](https://cloud.google.com/bigquery)
[![dbt](https://img.shields.io/badge/dbt-FF694B?style=for-the-badge&logo=dbt&logoColor=white)](https://getdbt.com)
[![Looker Studio](https://img.shields.io/badge/Looker_Studio-4285F4?style=for-the-badge&logo=google&logoColor=white)](https://datastudio.google.com/u/0/reporting/79d93465-e422-42cc-9db6-4ebeec2cc553/page/wJ4wF)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/RicarteAnalyst)

> *"Os números são negativos. E continuam ficando mais negativos a cada ano."*

</div>

---

## 📖 Sobre o Projeto

A massa de gelo da Antártida vem diminuindo de forma acelerada desde 2002. Este projeto transforma dados brutos sobre esse fenômeno em um pipeline de dados completo — da coleta à visualização — para evidenciar essa tendência com clareza e precisão.

---

## 🏗️ Arquitetura do Pipeline

```
┌─────────────────────────────────────────────────────────┐
│                                                         │
│   Our World in Data (IMBIE)                             │
│           ↓                                             │
│       Python (coleta e ingestão)                        │
│           ↓                                             │
│   ┌───────────────────────────────┐                     │
│   │       Google BigQuery         │                     │
│   │  🟤 Bronze → ⚪ Silver → 🟡 Gold │                     │
│   └───────────────────────────────┘                     │
│           ↓                                             │
│      dbt Cloud (transformações)                         │
│           ↓                                             │
│     Looker Studio (dashboard)                           │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

---

## 🛠️ Tecnologias Utilizadas

| Tecnologia | Finalidade |
|:---:|:---|
| 🐍 **Python** | Coleta e ingestão de dados |
| ☁️ **Google BigQuery** | Armazém de dados em nuvem |
| 🔴 **dbt Cloud** | Transformação, testes e documentação |
| 📊 **Looker Studio** | Visualização e dashboard |
| 🐙 **GitHub** | Versionamento do código |

---

## 📂 Estrutura do Projeto

```
projeto-degelo/
│
├── 📁 src/
│   ├── database.py          # Coleta de dados da web
│   ├── bigquery_upload.py   # Upload para o BigQuery
│   └── main.py              # Orquestrador do pipeline
│
├── 📁 data/
│   └── raw/
│       └── massa_gelo_antartida.csv
│
├── 📁 models/
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
│
├── .env
├── requirements.txt
└── README.md
```

---

## 📊 Camadas de Dados

<table>
  <tr>
    <td align="center">🟤<br><b>Bronze</b></td>
    <td>Dados brutos ingeridos diretamente da fonte, sem transformações.</td>
  </tr>
  <tr>
    <td align="center">⚪<br><b>Silver</b></td>
    <td>Dados limpos e tratados: conversão de tipos, remoção de nulos e padronização de colunas.</td>
  </tr>
  <tr>
    <td align="center">🟡<br><b>Gold</b></td>
    <td>Dados modelados em Star Schema com tabela fato, dimensão temporal e views analíticas para o dashboard.</td>
  </tr>
</table>

---

## 📈 Análises do Dashboard

| Visual | Descrição |
|:---:|:---|
| 📉 **Evolução Acumulada** | Perda total de massa de gelo desde 2002 |
| 📊 **Tendência Anual** | Média de variação sazonal por ano |
| 🏆 **Piores Anos** | Ranking dos anos com maior perda registrada |
| 🍕 **Meses Críticos** | Distribuição do derretimento por mês |
| 🔄 **Taxa de Variação** | Aceleração ou desaceleração da perda ano a ano |
| 🎯 **Pior Ano** | Ano com maior perda registrada (2020) |

---

## ⚙️ Como Executar

### Pré-requisitos

- Python 3.10+
- Conta no Google Cloud com BigQuery habilitado
- Arquivo `credentials.json` do Google Cloud

### Instalação

```bash
# Clone o repositório
git clone https://github.com/RicarteAnalyst/projeto-degelo.git
cd projeto-degelo

# Instale as dependências
pip install -r requirements.txt
```

### Configurar variáveis de ambiente

Crie um arquivo `.env` na raiz do projeto:

```env
BASE_URL=https://ourworldindata.org/grapher/ice-sheet-mass-balance.csv
API_KEY=sua_chave
GOOGLE_APPLICATION_CREDENTIALS=credentials.json
```

### Executar o pipeline

```bash
python src/main.py
```

---

## 🧪 Testes de Qualidade

Testes configurados com **dbt**:

- ✅ `not_null` — colunas `Data`, `Entidade` e `Variacao_Sazonal`
- ✅ Garantia de integridade dos dados na camada Silver

---

## 📡 Fonte dos Dados

**Our World in Data / IMBIE** — Ice Sheet Mass Balance Inter-comparison Exercise
- 📅 Período: 2002 a 2020
- 🌍 Região: Antártida

---

<div align="center">

## 👤 Autor

**Nicollas Ricarte**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/nicollasricarte/)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/RicarteAnalyst)

</div>
