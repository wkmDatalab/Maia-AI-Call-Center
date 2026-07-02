# LOAD - Final Data Loading and Analytics

## Purpose
This folder contains pipelines that load transformed data into final analytics tables, data marts, and reporting structures.

## Implementation
In this phase we create a bunch of transformation pipelines, which we call `Children Packages`, which are orchestrated by a `Parent Package` which is an orchestration pipeline.

Our Parent package is illustrated here: [PARENT_LOAD_WH](PARENT_LOAD_DWH.orch.yaml).
```mermaid 
flowchart LR

    %% Define all components and their labels
    START(Start)
    TRUNC_DIM[Truncate Dimensions]
    TRUNC_FACT[Truncate Facts]
    LOAD_AGENT[Load DIM Agent]
    LOAD_TYPE[Load DIM Call Type]
    LOAD_STATUS[Load DIM Call Status]
    LOAD_SENT[Load DIM Call Sentiment]
    LOAD_PRIORITY[Load DIM Call Priority]
    WAITFD(Wait For Dimensions)
    LOAD_FACT[Load FCT Call Transcript]

    %% Start leads to both Truncate steps
    START --> TRUNC_DIM
    TRUNC_DIM --> TRUNC_FACT

    %% Both Truncate steps lead to each Dimension Load step (All-to-All)
    %% Green connections in image, here modeled by line thickness and weight
    TRUNC_FACT -.-> LOAD_AGENT
    TRUNC_FACT -.-> LOAD_TYPE
    TRUNC_FACT -.-> LOAD_STATUS
    TRUNC_FACT -.-> LOAD_SENT
    TRUNC_FACT -.-> LOAD_PRIORITY

    %% All Dimension Load steps merge into the Wait node
    LOAD_AGENT --> WAITFD
    LOAD_TYPE --> WAITFD
    LOAD_STATUS --> WAITFD
    LOAD_SENT --> WAITFD
    LOAD_PRIORITY --> WAITFD

    %% Wait node leads to Fact loading
    WAITFD --> LOAD_FACT
```
![alt text](image.png)

The [LOAD_FCT_CALL_TRANSCRIPT](LOAD_FCT_CALL_TRANSCRIPT.tran.yaml) transfrmation pipeline ingests all of the dimension tables (`DWH.DIM_XXXX`) and the data from the  to create a Fact table.


```mermaid
graph LR
    %% Define Source Nodes
    SRC_TRANS[Table Input:
    STAGE.AUDIO_]
    LKP_AGENT[Lookup DIM_AGENT]
    LKP_TYPE[Lookup DIM_CALL_TYPE]
    LKP_PRIO[Lookup DIM_CALL_PRIORITY]
    LKP_STAT[Lookup DIM_CALL_STATUS]
    LKP_SENT[Lookup DIM_CALL_SENTIMENT]

    %% Define Processing Nodes
    JOIN_DIM[Join Dimensions]
    FILTER[Filter New Records]
    
    %% Define Target Node
    INSERT_FCT[Insert FCT_CALL_TRANSCRIPT]

    %% Connect Sources to Joiner
    SRC_TRANS --> JOIN_DIM
    LKP_AGENT --> JOIN_DIM
    LKP_TYPE --> JOIN_DIM
    LKP_PRIO --> JOIN_DIM
    LKP_STAT --> JOIN_DIM
    LKP_SENT --> JOIN_DIM

    %% Connect processing steps to target
    JOIN_DIM --> FILTER
    FILTER --> INSERT_FCT
```

lastly are the various `LOAD_DIM_XXXX` transfromation pipeline
![alt text](LOAD_DIM_AGENT.png) ![alt text](LOAD_DIM_CALL_PRIORITY.png) ![alt text](LOAD_DIM_CALL_SENTIMENT.png) ![alt text](LOAD_DIM_CALL_STATUS.png) ![alt text](LOAD_DIM_CALL_TYPE.png)
```mermaid
flowchart LR

    subgraph LOAD_DIM_CALL_TYPE
        direction LR
        CT_IN[Input Lookup] --> CT_FIL[Filter Call Type]
        CT_FIL --> CT_CALC[Calculate Uppercase]
        CT_CALC --> CT_NEW[Filter New Records]
        CT_NEW --> CT_INS[Insert DIM_CALL_TYPE]
    end

    subgraph LOAD_DIM_AGENT
        direction LR
        AG_IN[Input Agents] --> AG_FIL[Filter Existing Records]
        AG_FIL --> AG_CALC[Calculate Key]
        AG_CALC --> AG_INS[Insert DIM_AGENT]
    end

    subgraph LOAD_DIM_CALL_SENTIMENT
        direction LR
        CS_IN[Input Lookup] --> CS_FIL[Filter Call Sentiment]
        CS_FIL --> CS_CALC[Calculate Uppercase]
        CS_CALC --> CS_NEW[Filter New Records]
        CS_NEW --> CS_INS[Insert DIM_CALL_SENTIMENT]
    end

    subgraph LOAD_DIM_CALL_PRIORITY
        direction LR
        CP_IN[Input Lookup] --> CP_FIL[Filter Call Priority]
        CP_FIL --> CP_CALC[Calculate Uppercase]
        CP_CALC --> CP_NEW[Filter New Records]
        CP_NEW --> CP_INS[Insert DIM_CALL_PRIORITY]
    end

    subgraph LOAD_DIM_CALL_STATUS
        direction LR
        ST_IN[Input Lookup] --> ST_FIL[Filter Call Status]
        ST_FIL --> ST_CALC[Calculate Uppercase]
        ST_CALC --> ST_NEW[Filter New Records]
        ST_NEW --> ST_INS[Insert DIM_CALL_STATUS]
    end
```
## Contents
- Fact table population pipelines
- Dimension table updates
- Data mart creation
- Aggregate table building
- Final business-ready dataset preparation

## Pipeline Types
- Can include both orchestration (.orch.yaml) and transformation (.tran.yaml)
- Final stage transformations and loading
- Analytics table population

## Schemas Typically Used
- Source: `STAGE` schema (transformed data)
- Target: `ANALYTICS`, `MART`, or business-specific schemas

## Naming Convention
- Reflect final output or business purpose
- Include target schema/mart names
- Examples: `load_sales_mart.tran.yaml`, `build_customer_360.orch.yaml`

## Best Practices
- Ensure data consistency with ACID properties
- Implement slowly changing dimension logic where needed
- Optimize for query performance
- Create indexes and constraints on final tables