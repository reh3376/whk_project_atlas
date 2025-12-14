# Dependency graph

```mermaid
graph TD
  P00[Phase 00: Foundation] --> P01[Phase 01: Modular Platform]
  P00 --> P02[Phase 02: SDLC & DevEx]
  P01 --> P03[Phase 03: Data Pipelines]
  P02 --> P03
  P03 --> P04[Phase 04: MLOps + SME Supervision]
  P02 --> P05[Phase 05: Reliability/Obs/Sec]
  P01 --> P05
  P03 --> P05
  P04 --> P05
```
