# 🔬 VHDL Digital Logic Design Labs
![Language](https://img.shields.io/badge/Language-VHDL-DB5A21?style=for-the-badge&logo=VHDL&logoColor=white)
![FPGA](https://img.shields.io/badge/Target-FPGA-5A4294?style=for-the-badge)
![Tool](https://img.shields.io/badge/Tool-Xilinx%20Vivado-green?style=for-the-badge)

This repository contains a series of VHDL projects developed for a hands-on digital logic design laboratory course. The labs progress from fundamental combinational and sequential circuits to complex, modular systems that interface with real-world peripherals. Each project includes a synthesizable VHDL design and a corresponding testbench for simulation.

## 🧪 Labs Overview

<details>
<summary>
  <strong>Lab 1: Hexadecimal to 7-Segment Decoder</strong>
</summary>

* **Objective**: To design a purely **combinational circuit** that decodes a 4-bit binary input and drives a common-anode **7-segment display** to show the corresponding hexadecimal character (0-9, A, b, C, d, E, F).
</details>

<details>
<summary>
  <strong>Lab 2: Foundational Sequential Circuits</strong>
</summary>

This lab explores the design of common sequential building blocks.
* **Variable Frequency Divider**: A configurable counter-based circuit that divides a 50 MHz input clock to generate a lower frequency output with a 50% duty cycle.
* **Time-Multiplexed 7-Segment Driver**: A driver to display a 2-digit number on two separate 7-segment displays using a shared data bus. It employs **time-division multiplexing** to create the illusion that both digits are lit simultaneously.
* **8-Bit Up/Down Counter**: A versatile hexadecimal counter with `Enable` and `Up/Down` control inputs.
</details>

<details>
<summary>
  <strong>Lab 3: Sine Wave Generator (DDS)</strong>
</summary>

* **Objective**: To design a **Direct Digital Synthesis (DDS)** system that generates a sine wave.
* **Implementation**: The design uses a 64-sample **Look-Up Table (LUT)** stored in memory to hold the amplitude values of a single sine wave cycle. A clock divider and an address counter read these samples sequentially at a controlled rate. The 8-bit output is suitable for driving a Digital-to-Analog Converter (DAC).
* **Features**: Includes a `freq_sel` input to switch between multiple output frequencies (500 Hz, 250 Hz, 125 Hz) and a half-amplitude mode.
</details>

<details>
<summary>
  <strong>Lab 4: PS/2 Keyboard Interface</strong>
</summary>

* **Objective**: To design a VHDL module that interfaces with a standard **PS/2 keyboard** and decodes its serial data stream.
* **Implementation**: The controller handles the 11-bit PS/2 data frame (start, data, parity, and stop bits) by deserializing the input from the keyboard's data and clock lines.
* **Features**: It extracts the 8-bit scancode for each keypress and outputs a `new_code_available` flag. The design accounts for debouncing the noisy signals from the mechanical key switches.
</details>

<details>
<summary>
  <strong>Labs 5 & 6: Modular Traffic Light Controller</strong>
</summary>

This is a comprehensive, two-part project to design a complete, configurable traffic light controller for a two-way intersection.
* **Part 1 (Modules)**: Focuses on creating the system's building blocks:
    * A flexible **7-segment display driver** to show countdown timers or placeholder dashes.
    * An **input control module** to read Red/Green timer durations from DIP switches, validate them, and calculate the Yellow light duration.
* **Part 2 (System Integration)**: Implements the control logic and integrates all modules:
    * A main **Finite State Machine (FSM)** manages the complete traffic sequence (Green, Yellow, Red) for both directions.
    * A secondary FSM handles a **blinking yellow/red** mode.
    * A top-level **structural VHDL** file connects all modules to build the final system.
</details>

<details>
<summary>
  <strong>Lab 7: 4x4 Matrix Keypad Scanner</strong>
</summary>

* **Objective**: To design a controller to scan a **4x4 matrix keypad** and identify which key is pressed.
* **Implementation**: A **Finite State Machine (FSM)** continuously scans the keypad by driving one row low at a time and reading the state of the four columns. When a key press is detected, the FSM decodes the row and column to determine the specific key and outputs its 4-bit code.
</details>

## 🚀 How to Use
Each lab's design and testbench are provided as `.vhd` files.
1.  Use a VHDL simulator (like the one in **Xilinx ISE** or **ModelSim**) to run the testbench file and verify the design's behavior.
2.  Use a synthesis tool (like **Xilinx ISE**) to synthesize the main design file and generate resource utilization reports.
3.  The `.ucf` files (User Constraints Files) for hardware implementation on a specific FPGA board are also included where applicable.

## ✍️ Author
* **Ali Naghiloo**
