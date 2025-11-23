<h1 align="center"> BIST ARCHITECTURE USING PRPG VARIANTS</h1>

<h3 align="center">LFSR • CFSR • BS-LFSR • BS-CFSR</h3>




<p align="center">
  <a href="#-about-the-project">About</a> •
  <a href="#-bist-architecture">Architecture</a> •
  <a href="#-prpg-variants">Variants</a> •
  <a href="#-comparative-results">Results</a> •
  <a href="#-publication">Publication</a>
</p>

---

## 🚀 About the Project

This repository contains a complete **Built-In Self-Test (BIST)** architecture implemented for an **8-bit ALU**. The primary goal of this design is to compare four different Pseudo-Random Pattern Generators (PRPGs) to analyze their impact on **power, area, delay, and sequence coverage**.

The project focuses on optimizing On-Chip testing by evaluating:
1.  **LFSR** (Linear Feedback Shift Register - Baseline)
2.  **CFSR** (Counter-Based/Complete Feedback Shift Register)
3.  **BS-LFSR** (Bit-Swapping LFSR - Power Optimized)
4.  **BS-CFSR** (Bit-Swapping CFSR - Speed Optimized)

### 🧠 Key Objectives
* **Self-Sufficiency:** Demonstrating how BIST enables self-testing without external ATE equipment.
* **Efficiency:** Analyzing how PRPG choice directly impacts IC test efficiency.
* **Optimization:** Utilizing **Bit-Swapping** techniques to reduce dynamic power consumption.
* **Evaluation:** Providing Synthesis results on **90nm Cadence Genus**.

---

## 🧩 BIST Architecture

The general data flow of the testing architecture is as follows:

<p align="center">
  <b>PRPG ➔ ALU (CUT) ➔ ROM ➔ Comparator ➔ PASS/FAIL</b>
</p>

### Core Components
| Component | Description |
| :--- | :--- |
| **PRPG** | The pattern generator (LFSR / CFSR / BS-LFSR / BS-CFSR). |
| **8-bit ALU** | The Circuit Under Test (CUT) performing logic/arithmetic operations. |
| **ROM** | Stores the "Golden Signatures" (expected outputs). |
| **Comparator** | Compares the real-time ALU output against the ROM signature. |
| **Match Flag** | High/Low signal indicating if the circuit passed the test. |

---

## 🔧 PRPG Variants

### 1. LFSR (Linear Feedback Shift Register)
* **Patterns:** $2^n - 1$ states (misses the all-zero state).
* **Pros:** Simple hardware structure, fast generation.
* **Cons:** Higher switching activity (higher power).

### 2. CFSR (Complete Feedback Shift Register)
* **Patterns:** Generates all $2^n$ (256) patterns.
* **Pros:** Best fault coverage (100% sequence).
* **Cons:** Slightly larger area usage.

### 3. BS-LFSR (Bit-Swapping LFSR)
* **Technique:** Swaps adjacent bits at the output of the LFSR.
* **Pros:** **Lowest Power & Area**. Reduced transition density.
* **Cons:** Misses one state (like standard LFSR).

### 4. BS-CFSR (Bit-Swapping CFSR)
* **Technique:** Bit-swapping applied to the Complete sequence generator.
* **Pros:** **Fastest Delay & Highest Slack**.
* **Cons:** Medium power consumption compared to BS-LFSR.

---

## 📊 Comparative Results

*Synthesis performed on **90nm Cadence Genus**.*

| PRPG Variant | Power Consumption | Area Overhead | Delay (Speed) |
| :--- | :--- | :--- | :--- |
| **LFSR** | Medium | Medium | Medium |
| **CFSR** | High | Large | Slow |
| **BS-LFSR** | 🟢 **Lowest** | 🟢 **Smallest** | Good |
| **BS-CFSR** | Low | Medium | 🚀 **Fastest** |

### 💡 Key Takeaways
* **For Battery Operated/Low Power Devices:** Choose **BS-LFSR**.
* **For High-Performance/High-Speed Circuits:** Choose **BS-CFSR**.
* **For Maximum Fault Coverage:** Choose **CFSR**.

---

## 📌 Publication

This work is officially published and recognized in the **ICTDsC 2024 Springer Book Series**.

> **Link:** [(https://link.springer.com/chapter/10.1007/978-981-96-4543-5_22)]

---

## 🛠️ Tools Used
* **HDL:** Verilog
* **Simulation:** Xilinx Vivado / ModelSim
* **Synthesis:** Cadence Genus (90nm technology node)
