# LOAD - Final Data Loading and Analytics

## Purpose
This folder contains pipelines that load transformed data into final analytics tables, data marts, and reporting structures.

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