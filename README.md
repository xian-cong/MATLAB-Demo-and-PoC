# HDL Coder Optimization in Simulink
Area and speed optimization techniques for FPGA-targeted designs using a multi-module phase shift generator.

## Requirements

- MATLAB R2025b
- Simulink
- HDL Coder™

## Contents

1. [Base Model](#1--base-model)
2. [Optimization – Timing](#2--optimization-timing)
3. [Optimization – Area](#3--optimization-area)
4. [Built-in Counter Model](#4--built-in-counter-model)
5. [Built-in PWM Model](#5--built-in-pwm-model)
6. [Results Summary](#6--results-summary)

## 1 — Base Model

The base model implements the algorithm using fundamental Simulink building blocks, serving as the performance baseline before any optimization is applied.

```matlab
open multi_module_phase_shift_generator_base.slx
```

## 2 — Optimization: Timing

### Adaptive Pipelining

Automatically inserts pipeline registers across the design to reduce critical path delay. This comes at the cost of additional registers, as reflected in the increased register count.

```matlab
open adaptive_pipelining_multi_module_phase_shift_generator_base.slx
```

### Input/Output Pipelining + Distributed Pipelining

Combines input/output pipelining with distributed pipelining to achieve a similar critical path improvement as adaptive pipelining, but with more efficient register usage overall.

```matlab
open input_output_distributed_pipelining_multi_module_phase_shift_generator_base.slx
```

## 3 — Optimization: Area

### Resource Sharing

Reduces the number of multipliers by time-multiplexing shared hardware across multiple operations. While this significantly cuts multiplier usage, it introduces additional multiplexers and registers to manage the scheduling, and slightly increases the critical path delay.

> **Note:** Avoid this approach if your design is already timing-critical.

```matlab
open resource_sharing_multi_module_phase_shift_generator_base.slx
```

## 4 — Built-in Counter Model

Replaces the basic Simulink counter logic with HDL Coder's native Counter block, achieving the same functional output with substantially fewer registers and multiplexers. This demonstrates the resource efficiency gains from using HDL-aware primitives.

```matlab
open multi_module_phase_shift_generator_built_in_counter.slx
```

## 5 — Built-in PWM Model

Uses HDL Coder's native PWM block to generate a comparable output. Because this block only supports the `double` data type, the model must be configured to use **native floating-point** when generating HDL code. This results in significantly higher resource consumption across all categories, making it less suitable for area-constrained designs.

> **Warning:** Only use this when rapid prototyping or floating-point accuracy is required. For production or resource-constrained designs, consider a fixed-point PWM equivalent instead.

```matlab
open multi_module_phase_shift_generator_built_in_pwm.slx
```