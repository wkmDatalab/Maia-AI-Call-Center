# STAGE - Data Transformation and Staging
## Purpose
This folder contains transformation pipelines (.tran.yaml) that clean, transform, and prepare data within the data warehouse.

## Implementation 
We have two transformation pipelines [STAGE_AUDIO_TRANSCRIPT](STAGE_AUDIO_TRANSCRIPT.tran.yaml) & [STAGE_AUDIO_TRANSCRIPT_ANALYSIS](STAGE_AUDIO_TRANSCRIPT_ANALYSIS.tran.yaml). 
```mermaid
flowchart LR 


subgraph STAGE["STAGE_AUDIO_TRANSCRIPT"]
direction TB
A[Table Input: 
EXTRACT.AUDIO_FILES]-->B[Filter: 
Filter New Records using STAGE.AUDIO_TRANSCRIPT]-->C[Calculator: 
Transcribe Audio with AI_TRANSCRIBE]
C-->D[Table Output: 
STAGE.AUDIO_TRANSCRIPT]
end

subgraph ANALYSIS["STAGE_AUDIO_TRANSCRIPT_ANALYSIS"]
direction TB
E[Table Input:
STAGE.AUDIO_TRANSCRIPT]-->F["Filter: 
Filter Existing records using STAGE.AUDIO_TRANSCRIPT_ANALYSIS"]
F-->G[Cortex Answer Extract: 
] -->H[Cortex Summarise:
]-->I[Cortex Sentiment:
]-->J[Cortex Multi-prompt: 
]-->K[Calculator: 
Data Extraction]-->L[Rename:
Standardize cortex generated column names]-->M[Table Output: 
STAGE.AUDIO_TRANSCRIPT_ANALYSIS]
end

Z[EXTRACT.AUDIO_FILES]-->STAGE--STAGE.AUDIO_TRANSCRIPT-->ANALYSIS
```

## Contents
- Data cleansing and validation pipelines
- Business rule transformations
- Data enrichment and calculated fields
- Data type conversions and formatting
- Staging table population

## Pipeline Types
- **Transformation pipelines only** (.tran.yaml)
- Data transformations within the warehouse
- Data quality and validation processes

## Schemas Typically Used
- Source: `EXTRACT` schema (raw data)
- Target: `STAGE` schema (cleaned/transformed data)

## Naming Convention
- Reflect the transformation purpose
- Include entity names being transformed
- Examples: `clean_customer_data.tran.yaml`, `calculate_metrics.tran.yaml`

## Best Practices
- Use idempotent transformations
- Implement data quality checks
- Document business logic and transformations
- Test with sample data before full runs