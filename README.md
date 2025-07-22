# 4-Bit Nanoprocessor Design

A comprehensive 4-bit nanoprocessor implementation designed for the "In22-S2-CS1050 - Computer Organization and Digital Design" course at the University of Moratuwa. This project demonstrates a complete processor design from fundamental digital components to a fully functional system.

## 🎯 Project Overview

This project involved designing a 4-bit processor from scratch, capable of executing a comprehensive instruction set. The design encompasses creating fundamental digital components in VHDL, integrating them into a functional processor, and validating the design through simulation and deployment on a Basys 3 FPGA board.

### Key Design Philosophy

Our nanoprocessor is distinguished by its **pure logic gate implementation** - no high-level behavioral VHDL constructs like `if/when/switch` statements were used. Every component was optimized using Karnaugh maps to minimize logic gates, making this design:
- A direct blueprint for silicon implementation
- Highly optimized for space and power consumption
- Cost-effective in terms of material usage

## ✨ Key Features

- **8-Register Bank**: Eight 4-bit general-purpose registers (R0-R7)
- **4-bit Carry Look-Ahead Adder/Subtractor**: High-speed arithmetic operations
- **4-bit Comparator**: Advanced conditional logic support
- **Expanded Program ROM**: 16-line, 14-bit wide memory for larger programs
- **13-Instruction Set**: Comprehensive instruction set for versatile programming

## ⚡ Performance Optimizations

- **Enhanced Arithmetic**: Carry Look-Ahead Adder/Subtractor for faster computations
- **Advanced Control Flow**: Four dedicated comparator instructions for flexible programming
- **Power Efficiency**: Automatic disabling of unused components (Adder and Comparator)
- **Resource Conservation**: Karnaugh-map optimization minimizes logic gate usage

## 📋 Instruction Set Architecture

The nanoprocessor supports 13 instructions with the following format:
- `R` values denote registers (0-7)
- `d` represents 4-bit immediate data or jump address

| Op Code | Mnemonic | Syntax | Description | Format (14-bit) |
|---------|----------|--------|-------------|-----------------|
| `0000` | `ADD` | `ADD Ra, Rb` | Adds Ra and Rb, stores result in Ra | `0000 RaRaRa RbRbRb 0000` |
| `0001` | `SUB` | `SUB Ra, Rb` | Subtracts Ra from Rb, stores result in Ra | `0001 RaRaRa RbRbRb 0000` |
| `0010` | `MOVI` | `MOVI R, d` | Moves immediate 4-bit value d to register R | `0010 RRR 000 dddd` |
| `0011` | `JZR` | `JZR R, d` | Jumps to line d if register R equals 0 | `0011 RRR 000 dddd` |
| `0100` | `INC` | `INC R` | Increments register R by 1 | `0100 RRR 001 0000` |
| `0101` | `DEC` | `DEC R` | Decrements register R by 1 | `0101 RRR 010 0000` |
| `0110` | `NEG` | `NEG R` | 2's complement of register R | `0110 RRR 000 0000` |
| `0111` | `RES` | `RES R` | Resets register R to 0 | `0111 RRR 000 0000` |
| `1000` | `COM` | `COM Ra, Rb` | Compares registers Ra and Rb | `1000 RaRaRa RbRbRb 0000` |
| `1001` | `NOP` | `NOP` | No operation | `1001 000 000 0000` |
| `1010` | `IFAG` | `IFAG Ra, Rb, d` | If Ra > Rb, jump to line d | `1010 RaRaRa RbRbRb dddd` |
| `1011` | `IFE` | `IFE Ra, Rb, d` | If Ra = Rb, jump to line d | `1011 RaRaRa RbRbRb dddd` |
| `1100` | `IFNE` | `IFNE Ra, Rb, d` | If Ra ≠ Rb, jump to line d | `1100 RaRaRa RbRbRb dddd` |

## 🔧 System Components

The nanoprocessor is built from custom VHDL components, each optimized for minimal gate count:

### Core Components
- **Instruction Decoder**: Pure logic-based control unit for 14-bit instruction interpretation
- **Register Bank**: Manages eight 4-bit general-purpose registers
- **Program ROM**: Stores machine code instructions
- **Program Counter**: 4-bit register for instruction addressing

### Arithmetic & Logic Units
- **4-bit Carry Look-Ahead Adder/Subtractor**: High-speed arithmetic operations
- **4-bit Comparator**: Sets status flags (AGreat, Equal) for conditional operations

### Support Components
- **Multiplexers**: 2-way and 8-way 4-bit MUXes for data path selection
- **Slow Clock**: Clock divider (10MHz → 1Hz) for demonstration
- **7-Segment Display LUT**: Maps register values to display output

## 🛠️ Development Tools

### Assembly Compiler
A Python-based compiler facilitates program development:
- **Input**: Human-readable assembly code from `code.txt`
- **Output**: 14-bit machine code for direct VHDL integration
- **Usage**: Automatically overwrites input file with compiled output

## 📚 Code Examples

### Fibonacci Sequence Generator
```assembly
MOVI R7, 0      ; Initialize first number
MOVI R4, 5      ; Counter
MOVI R7, 1      ; Second number
MOVI R6, 0      ; Temp storage
ADD R7, R6      ; Calculate next Fibonacci
DEC R4          ; Decrement counter
SUB R6, R7      ; Update previous number
JZR R4, 10      ; Jump if counter is zero
JZR R0, 5       ; Loop back
JZR R0, 10      ; End program
```

### Iterative Sum (1+2+3)
```assembly
MOVI R3, 2      ; Initialize counter
MOVI R7, 3      ; Initialize sum
MOVI R6, 1      ; Step value
NEG R6          ; Make it negative for countdown
ADD R7, R3      ; Add to sum
ADD R3, R6      ; Decrement counter
JZR R3, 7       ; Jump if done
JZR R0, 5       ; Loop back
```

### Conditional Operations Demo
```assembly
MOVI R3, 3      ; Load first value
MOVI R7, 5      ; Load second value
MOVI R4, 5      ; Load comparison value
IFAG R7, R3, 7  ; If R7 > R3, jump to line 7
IFE R7, R3, 10  ; If R7 = R3, jump to line 10
NOP             ; No operation
DEC R7          ; Decrement R7
JZR R0, 4       ; Jump back to comparison
```

## 👥 Team Contributors

| Team Member | Student ID | Contributions |
|-------------|------------|---------------|
| **Abhayawickrama G.M.A.M.** | 220011G | 2-way 4-bit MUX, 8-way 4-bit MUX, Register Bank |
| **Gangadari M.D.S.** | 220178X | Program ROM, 4-bit RCA for Program Counter |
| **Senevirathne S.M.P.U.** | 220599M | 4-bit Carry Look-Ahead Adder/Subtractor, 4-bit Comparator |
| **Weerawansa M.S.I.** | 220690J | Instruction Decoder, Program Counter |

## 🚀 Getting Started

1. **Hardware Requirements**: Basys 3 FPGA Development Board
2. **Software Requirements**: Vivado Design Suite for VHDL synthesis
3. **Assembly Development**: Python 3.x for the compiler tool

## 📁 Repository Structure

```
Project Files/
├── Basic Nanoprocessor/
│   ├── Components/                    # Core VHDL components
│   │   ├── 3BitAdder/
│   │   ├── 4BitAddSubUnitComp/
│   │   ├── instruction decoder/
│   │   ├── Multiplexers/
│   │   ├── MUX 8 to 1/
│   │   ├── ProgramCounter/
│   │   ├── PROM1/
│   │   └── RegisterBank_1/
│   ├── Nanoprocessor/
│   │   ├── Nanoprocessor1.vhd       # Basic processor implementation
│   │   ├── schematic.pdf            # Circuit schematic
│   │   └── timing.PNG               # Timing diagrams
│   └── Basys3Labs.xdc               # FPGA constraints file
│
├── Improved Nanoprocessor/
│   ├── Components/                   # Enhanced VHDL components
│   │   ├── 14_bit_instruction_decoder/
│   │   ├── Carry_Look_Ahead_Adder_Subtractor/
│   │   ├── Comparator/
│   │   ├── Multiplexers/
│   │   ├── MUX 8 to 1/
│   │   ├── ProgramCounter/
│   │   ├── PROM2/
│   │   └── RegisterBank_1 - improved/
│   ├── Compiler/
│   │   └── Compiler.py              # Assembly compiler tool
│   ├── FinalNanoprocessor - Fibonacci/
│   │   ├── Nanoprocessor2.vhd       # Fibonacci demo implementation
│   │   ├── Compiler and Programs/
│   │   │   └── Programs/fibonacci.txt
│   │   └── schematic.pdf
│   ├── FinalNanoprocessor - If/     # Conditional operations demo
│   └── FinalNanoprocessor - Iterative Add/  # Arithmetic demo
└── Basys3Labs.xdc                   # FPGA constraints file
```

## 🎓 Academic Context

This project was developed as part of the Computer Organization and Digital Design course at the University of Moratuwa, demonstrating practical application of:
- Digital logic design principles
- VHDL hardware description language
- FPGA implementation techniques
- Assembly language programming
- System-level computer architecture

---

*This project showcases the complete design flow from specification to implementation of a functional processor, emphasizing optimization techniques and practical hardware constraints.*
