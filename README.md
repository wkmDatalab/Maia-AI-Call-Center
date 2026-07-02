# Maia-AI-Call-Center

This repository contains a Matillion-based workflow for loading, transforming, and modeling call-center audio and lookup data into a warehouse-ready analytics solution.

## Workflow Summary

1. [00_DDL](00_DDL/README.md) - Recreates the target schemas and tables used across the pipeline.
2. [01_EXTRACT](01_EXTRACT/README.md) - Loads source files such as audio transcripts and lookup data into the EXTRACT layer.
3. [02_STAGE](02_STAGE/README.md) - Transforms extracted data into curated staging tables and enrichment outputs.
4. [03_LOAD](03_LOAD/README.md) - Loads dimension tables and the fact table into the analytics layer.
5. [04_RESOURCES](04_RESOURCES/README.md) - Stores supporting SQL DDL, reusable assets, and configuration files.

## Repository Purpose

The workflow follows a standard ELT pattern:
- Ingest raw files and reference data
- Stage and enrich the data
- Load analytics-ready dimensions and facts
- Support repeatable deployment and redevelopment through version-controlled Matillion pipelines

## Notes

- The sample data and supporting files are stored under [assets](assets).
- SQL definitions for the warehouse objects are maintained in [04_RESOURCES/SQL](04_RESOURCES/SQL).


