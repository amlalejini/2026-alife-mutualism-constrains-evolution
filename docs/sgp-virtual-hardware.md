# Virtual hardware for digital organisms

## Virtual hardware components

Each digital organism comprises a linear program (its genome) and a set of virtual hardware components for executing its genome.
Genomes use the SignalGP-lite representation (<https://github.com/mmore500/signalgp-lite>).

In this work, the virtual hardware contains:
- 8 registers: these are used as "working memory", used as source operands and destination operands for instructions
- 2 memory stacks: serve as additional memory for programs. Programs can push values from registers to a stack or pop values from a stack into a register. Each stack has a maximum size of 16 values.

## Instruction set

SignalGP instruction set used in digital organism genomes in this work.

Abbreviations:

- EOP: End of program
- Reg: local register
  - Reg[0] indicates the value at the register specified by an instruction's first _argument_, Reg[1] indicates the value at the register specified by an instruction's second argument, and Reg[2] indicates the value at the register specified by the instruction's third argument.
  - Reg[0], Reg[1], _etc_: Register 0, Register 1, _etc._
- Arg: Instruction argument
  - Arg[i] indicates the i'th instruction argument (an integer encoded in the genome)
  - E.g., Arg[0] is an instruction's first argument

Instructions that would produce undefined behavior (e.g., division by zero) are treated as no operations.

Instruction | Arguments Used | Description |
| :--- | :---: | :--- |
| `Nop` | 0 | No operation |
| `Increment` | 1 | Reg[0] = Reg[0] + 1 |
| `Decrement` | 1 | Reg[0] = Reg[0] - 1 |
| `ShiftLeft` | 1 | Reg[0] = Reg[0] << 1 |
| `ShiftRight` | 1 | Reg[0] = Reg[0] >> 1 |
| `Subtract` | 3 | Reg[0] = Reg[1] - Reg[2] |
| `Nand` | 3 | Reg[0] = ~(Reg[1] & Reg[2]) |
| `Push` | 1 | Push Reg[0] to active memory stack |
| `Pop` | 1 | Pop top of active memory stack. Reg[0] = popped value |
| `SwapStack` | 0 | Change active stack. |
| `Swap` | 2 | Swap values between Reg[0] and Reg[1] |
| `Reproduce` | 0 | Triggers organism reproduction attempt if organism has sufficient resources. |
| `IO` | 1 | Output value in Reg[0], and set Reg[0] = new input value. |
| `JumpIfNEq` | 2 | if (Reg[0] != Reg[1]) Jump to Anchor specified by instruction tag (tag matching determines target Anchor). |
| `JumpIfLess` | 2 | if (Reg[0] < Reg[1]) Jump to Anchor specified by instruction tag (tag matching determines target Anchor). |
| `JumpIfEq` | 2 | if (Reg[0] == Reg[1]) Jump to Anchor specified by instruction tag (tag matching determines target Anchor). |
| `Anchor` | 0 | Tag-based code label that can be jumped to with a jump instruction. |