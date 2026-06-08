# LFTDO - Livestock Farming Theft Detection Ontology

[![WIDOCO](https://img.shields.io/badge/Documentation-WIDOCO-blue)](WIDOCO/index-en.html)
[![OWL 2 DL](https://img.shields.io/badge/OWL-2%20DL%20(SROIQ(D))-1F4E79)](https://www.w3.org/TR/owl2-profiles/)
[![OOPS! TOQS](https://img.shields.io/badge/OOPS!%20TOQS-100%25-brightgreen)](https://oops.linkeddata.es/)
[![License](https://img.shields.io/badge/License-CC%20BY%204.0-blue)](https://creativecommons.org/licenses/by/4.0/)
[![Protégé](https://img.shields.io/badge/Developed%20with-Protégé%205.5.0-orange)](https://protege.stanford.edu/)
[![Reasoner](https://img.shields.io/badge/Reasoner-Pellet%20%7C%20HermiT-purple)](https://github.com/stardog-union/pellet)
[![OWL](https://img.shields.io/badge/Ontology-OWL%202-green)](https://www.w3.org/OWL/)
[![RDF](https://img.shields.io/badge/Data-RDF-orange)](https://www.w3.org/RDF/)
[![SPARQL](https://img.shields.io/badge/Query-SPARQL-purple)](https://www.w3.org/TR/sparql11-query/)
[![SWRL](https://img.shields.io/badge/Rules-SWRL-red)](https://www.w3.org/submissions/SWRL/)
---

## Overview

The **Livestock Farming Theft Detection Ontology (LFTDO)** is a domain-specific OWL 2 DL ontology designed to support intelligent, semantically-driven livestock theft detection in rural South Africa. It provides a formal knowledge representation of livestock behaviour, IoT sensor data, geofence monitoring, and theft event classification enabling AI-driven reasoning over real-time sensor streams from GPS tracking collars and IoT devices.

The LFTDO is the knowledge core of the **Onto-AIoTA** (Ontology-based IoT AI Architecture), where it functions as the Semantic Layer transforming raw sensor data into classified, severity-graded theft alerts through 27 SWRL inference rules.

> **Research Context:**  Master of Computer Science dissertation - Tshwane University of Technology (TUT). 
> **Researcher:** Tumelo Modise 
> **Supervisors:** Dr. A Buitendag   
> **Co-Supervisors:** Prof JC Jansen van Vuuren and Dr. Z Dawood   
> **Namespace:** `https://github.com/tumelomodise/LFTDO#`
---
## Repository Structure
```
LFTDO/
├── README.md                   ← This file — repository overview
├── LICENSE                     ← CC BY 4.0
├── v0.04/
│   ├── README.md               ← v0.04 release notes and metrics
│   ├── LFTDO_v0.04.owl         ← Initial validated OWL file
│   └── ABox/
│       └── Scenario1_2/        ← Manual Protégé ABox (Scenarios 1 & 2)
├── v0.05/
│   ├── README.md               ← v0.05 release notes and metrics
│   ├── LFTDO_v0.05.owl         ← Revised OWL file
│   └── ABox/
│       └── Scenario1_2/
├── ...
├── v0.12/
│   ├── README.md               ← v0.12 current release
│   ├── LFTDO_v0.12.owl         ← Final production OWL file
│   ├── ABox/
│   │   ├── Cellfie/
│   │   │   ├── 1_Sheep_SensorData_LoadData.xls
│   │   │   ├── 1_SensorData_MAPPING_RULE.json
│   │   │   └── [additional entity file pairs]
│   │   └── Scenarios/
│   │       ├── Scenario1_Goat_BehaviouralAnomaly.owl
│   │       ├── Scenario2_Cow_ComplexTheft.owl
│   │       ├── Scenario3_Sheep_RestingHealthCheck.owl
│   │       ├── Scenario4_Sabotage_DeviceTamper.owl
│   │       └── Scenario5_Sheep100_HighSpeedFlight.owl
│   ├── SWRL/
│   │       ├── RL_FENCE_BREACH_THEFT_SIGNAL.json
│   │       └── [additional files]
│   ├── SPARQL/
│   │   └── CQ1_CQ8_Queries.sparql
│   └── docs/
│       └── /index-en.html
└── docs/
    ├── LFTDO_Architecture_(Onto_AIoTA)_Diagram.png
    ├── LFTDO_Conceptual_Diagram.png
    └── LFTDO_OntoGraf_Visualisation.png

```

---

## Current Version

| Attribute | Value |
|---|---|
| **Current Version** | v0.12 |
| **OWL Profile** | OWL 2 DL (SROIQ(D)) |
| **Reasoner** | Pellet (primary) \| HermiT (secondary validation) |
| **Total Axioms** | 22,586 (15,884 logical, 2,386 Declaration,4,316 Annotation) |
| **Classes** | 105 |
| **Object Properties** | 108 |
| **Data Properties** | 174 |
| **SWRL Rules** | 27 |
| **ABox Individuals** | 1,865 (initial) \| 2,000+ (Cellfie scale) |
| **Annotation Assertions** | 4,316 |
| **ObjectProperty Assertions** | 4,768 |
| **DataProperty Assertions** | 7,852 |
| **OOPS! TOQS** | 100% (all 40 pitfall categories: zero pitfalls) |
| **Development Tools** | Protégé 5.5.0 \| Cellfie plugin \| OOPS! v3.0 |
| **Namespace Prefix** | `LFTDO:` |

---

## Key Features

- **Two-subdomain architecture:** Livestock Management & Environment (contextual baseline) and Livestock Theft Detection (detection logic)
- **27 SWRL rules** across 6 functional groups: Theft Detection (10), Health Anomaly (4), Escape Detection (6), Environmental Context (3), Normal Baseline (2), Abnormal State & System Integrity (2)
- **Species-specific fever thresholds:** Cattle (≥39.4°C), Sheep (≥40.0°C), Goat (≥39.7°C) prevents health-based false alarms
- **Four-directional geofence monitoring** via GPS latitude/longitude boundary rules
- **False-alarm reduction** through health disambiguation and environmental contextualisation
- **Forensic readiness** via SPARQL temporal path queries (CQ5) and TheftEvent audit trail
- **Scalable ABox population** via Cellfie plugin with structured XLS + JSON file pairs

---

## Ontology Subdomains

### Subdomain 1 - Livestock Management & Environment
Provides the contextual baseline: `Livestock`, `Behaviour`, `BehaviourState`, `Participant`, `Location`, `HealthCondition`, `EnvironmentalCondition`, `Device`, `SensorData`, `SoftwareApplication`

### Subdomain 2 - Livestock Theft Detection
Provides the detection logic: `NormalState`, `AbnormalState`, `TheftIndicator`, `TheftEvent`, `CattleWithFever`, `SheepWithFever`, `GoatWithFever`, `ExtremeDayTimeHeat`, `ExtremeNightTimeHeat`

---

## Semantic Detection Chain

```
Livestock
  └─ exhibitsBehaviour ──► Behaviour
       └─ hasCurrentState ──► BehaviourState
            └─ transitionStateTo ──► AbnormalState      ← SWRL fires
                 └─ indicates ──► TheftIndicator
                      └─ causedTheftEvent ──► TheftEvent
                           └─ notifies ──► Participant
```

---
## ABox Scenarios

| # | Scenario | Species | SWRL Rules Triggered | Expected Output |
|---|---|---|---|---|
| 1 | Behavioural Anomaly Detection | Goat | RL_GOAT_ANOMALY_TRANSITION, RL_BEHAVIOUR_DEVIATION | HighRustlingTheftEvent |
| 2 | Multi-Factor Complex Theft | Cattle | RL_COMPLEXTHEFT_CORRELATION, RL_CATTLEFEVER_DETECTION | ComplexTheftEvent |
| 3 | Resting Behaviour Health Check | Sheep/Goat/Cattle | RL_PROLONGED_RESTING_DEVIATION_* | HealthAlertEvent (not TheftEvent) |
| 4 | Sabotage / Device Tamper Detection | - | RL_DEVICE_SABOTAGE_CHECK, RL_SYSTEM_INTEGRITY_CHECK | SecurityBreachEvent |
| 5 | High-Speed Flight (Cellfie scale, 100 Sheep) | Sheep | RL_THEFT_IN_PROGRESS, RL_FENCE_BREACH_THEFT_SPEED | HighSpeedTheftEvent |

---

## Loading the ABox via Cellfie (Protégé 5.5.0)

> ⚠️ **Important:** The single-sheet MappingMasterDSL approach does **not** work in Protégé 5.5.0. Each entity type requires a **separate `.xls` data file paired with its own `.json` mapping rule file.**

```
File pair structure:
  [EntityType]_LoadData.xls        ← structured data (column headers = property names)
  [EntityType]_MAPPING_RULE.json   ← Cellfie DSL rules referencing column addresses
```

**Steps:**
1. Open Protégé 5.5.0 with `LFTDO_v0.12.owl` loaded
2. Go to `Tools > Cellfie`
3. Click `Open Spreadsheet` → select `.xls` file
4. Click `Load Rule File` → select matching `.json` file
5. Click `Generate Axioms`
6. Repeat for each entity type
7. Run Pellet reasoner to validate SWRL inference

---

## SPARQL Queries (CQ1 to CQ8)

All eight Competency Questions are implemented as SPARQL queries. See `v0.12/SPARQL/CQ1_CQ8_Queries.sparql`.

| CQ | Purpose |
|---|---|
| CQ1 | List all livestock and their farm location |
| CQ2 | Retrieve all TheftEvents with time, location, and affected livestock |
| CQ3 | Retrieve livestock with sensor anomalies outside geo-fence |
| CQ4 | Retrieve livestock behaviour with start/end times |
| CQ5 | Retrieve ordered movement path during TheftEvent window |
| CQ6 | Retrieve individual livestock profile (ID, species, breed, location) |
| CQ7 | Retrieve historical TheftEvent types and counts |
| CQ8 | Retrieve specific livestock TheftEvent chain including indicators and severity |

---

## Version History

| Version | Key Change | OOPS! TOQS | Axioms |
|---|---|---|---|
| v0.00 | Initial class skeleton (78 classes) | Partial | ~800 |
| v0.01 | Object and data properties added | Partial | ~3,200 |
| v0.02 | BehaviourState refactoring: NormalState/AbnormalState model | Partial | ~6,400 |
| v0.03 | 27 SWRL rules + primitive classes complete | Partial | ~12,000 |
| v0.04 | Initial ABox (Scenarios 1 to 2) + Annotation Assertions | 100% | ~14,000 |
| v0.05–v0.11 | Iterative OOPS! maintenance cycles + ABox expansion | 100% | Incremental |
| **v0.12** | **Final : 2,000+ individuals (Cellfie) + full CQ validation** | **100%** | **22,586** |

---

## Citation

```bibtex
@mastersthesis{LFTDO2024,
  title     = {An Ontology-based model for livestock tracking and monitoring to reduce livestock theft},
  author    = {Tumelo Modise},
  school    = {Tshwane University of Technology (TUT)},
  year      = {2026},
  note      = {LFTDO v0.12. Available at: 
               https://github.com/tumelomodise/LFTDO}
}
```

---
## License

This ontology is released under the [Creative Commons Attribution 4.0 International License (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).  
You are free to share and adapt the material for any purpose, provided appropriate credit is given.

---

## Contact

For questions, issues, or collaboration:  
📧 tumelomodise4@gmail.com 

🏛️ Department of Computer Science, Tshwane University of Technology(TUT)

🔗 AgroPortal submission link — (https://agroportal.eu/ontologies/LFTDO)

