# VHDL Designs

> A collection of VHDL designs examples for digital circuits

![license](https://img.shields.io/github/license/leoraclet/vhdl-designs)
![language](https://img.shields.io/github/languages/top/leoraclet/vhdl-designs)
![last commit](https://img.shields.io/github/last-commit/leoraclet/vhdl-designs)

## Table of contents

- [📖 About](#-about)
- [🙏 Acknowledgements](#-acknowledgements)
- [🧩 Designs](#-designs)
- [📦 Structure](#-structure)
- [🔧 Tools](#-tools)
- [✈️ Usage](#️-usage)
    - [🚀 Simulate](#-simulate)
    - [🧪 Check \& Analyze](#-check--analyze)
- [📚 Resources](#-resources)
- [✔️ To-do](#️-to-do)
- [📜 License](#-license)

## 📖 About

> [!IMPORTANT]
> I've made this collection to regroup all those designs I've made over the years in one single place and make it available to others who might look for examples circuits.

This repository contains a collection of **VHDL circuit** examples for digital design course.

These designs are reusable and suitable for a variety of computing and electronics projects, and they were build during my computer science and electronics classes as part of my engineering degree.

Some designs might have multiple architecture implementations to show design options and variations. Basic test bench examples are also given for some circuits.

> [!warning]
> Not all the designs are tested and verified (but most are), so feel free to send any fixes if you see any mistakes.

## 🙏 Acknowledgements

- My school's professors, for introducing me to this "language" and the lessons that came with it.
- [VHDL Digital Design](https://github.com/fcayci/vhdl-digital-design) - Took inspiration for the Makefile and some VHDL designs. I've stumbled upon this repo while re-structuring mine and looking for already existing ones.

## 🧩 Designs

| File                                                     | Design Unit                              | Tested | Analyzed |
| -------------------------------------------------------- | ---------------------------------------- | :----: | :------: |
| [**`ad_ff`**](./rtl/ad_ff.vhd)                           | Asynchronous D Flip-Flop                 |   ✗    |    ✓     |
| [**`add_sub4`**](./rtl/add_sub4.vhd)                     | 4-bits Adder & Subtractor                |   ✗    |    ✓     |
| [**`add16`**](./rtl/add16.vhd)                           | 16-bits Adder                            |   ✗    |    ✓     |
| [**`add4`**](./rtl/add4.vhd)                             | 4-bits Adder                             |   ✗    |    ✓     |
| [**`anti_reb`**](./rtl/anti_reb.vhd)                     | De-bouncer                               |   ✗    |    ✓     |
| [**`bin2code`**](./rtl/bin2code.vhd)                     | 2-bit line decoder                       |   ✗    |    ✓     |
| [**`bin2seven_eco`**](./rtl/bin2seven_eco.vhd)           | ... with on/off signal                   |   ✗    |    ✓     |
| [**`bin2seven`**](./rtl/bin2seven.vhd)                   | Binary to 7 segments                     |   ✗    |    ✓     |
| [**`clk_halve`**](./rtl/clk_halve.vhd)                   | Frequency Halfer                         |   ✗    |    ✓     |
| [**`cmp4`**](./rtl/cmp4.vhd)                             | 4-bits Comparator                        |   ✗    |    ✓     |
| [**`cmpt4_bidirena`**](./rtl/cmpt4_bidirena.vhd)         | Bidirectional counter                    |   ✗    |    ✓     |
| [**`cnt256`**](./src/cnt26.vhd)                          | Synchronous 8-bit bi-directional counter |   ✗    |    ✓     |
| [**`cnt4`**](./rtl/cnt4.vhd)                             | Synchronous 4-bit counter                |   ✗    |    ✓     |
| [**`code2bin`**](./rtl/code2bin.vhd)                     | 2-bit line encoder                       |   ✗    |    ✓     |
| [**`d_ff`**](./rtl/d_ff.vhd)                             | Synchronous D Flip-Flop                  |   ✗    |    ✓     |
| [**`d_latch`**](./rtl/d_latch.vhd)                       | Synchronous D Latch                      |   ✗    |    ✓     |
| [**`div10`**](./rtl/div10.vhd)                           | Frequency Divider by 10                  |   ✗    |    ✓     |
| [**`div2`**](./rtl/div2.vhd)                             | Frequency Divider by 2                   |   ✗    |    ✓     |
| [**`dst_hamm`**](./rtl/dst_hamm.vhd)                     | Hamming Distance calculator              |   ✗    |    ✓     |
| [**`full_adder`**](./rtl/full_adder.vhd)                 | Full Adder                               |   ✗    |    ✓     |
| [**`gen_ena`**](./rtl/gen_ena.vhd)                       | Frequency Divider                        |   ✗    |    ✓     |
| [**`half_add`**](./rtl/half_add.vhd)                     | Half Adder                               |   ✗    |    ✓     |
| [**`jk_ff`**](./rtl/jk_ff.vhd)                           | Synchronous JK Flip-Flop                 |   ✗    |    ✓     |
| [**`mem4x8`**](./rtl/mem4x8.vhd)                         | 4-byte Synchronous Memory                |   ✗    |    ✓     |
| [**`mul_2bits`**](./rtl/mul_2bits.vhd)                   | 2-bits Multiplier                        |   ✗    |    ✓     |
| [**`mux2x8`**](./rtl/mux2x8.vhd)                         | Two-channel multiplexer                  |   ✗    |    ✓     |
| [**`mux4x8`**](./rtl/mux4x8.vhd)                         | Four-channel multiplexer                 |   ✗    |    ✓     |
| [**`mux4x8`**](./src/mux4x1.vhd)                         | Four-1bit-channel multiplexer            |   ✗    |    ✓     |
| [**`pdf_hamm`**](./rtl/pds_hamm.vhd)                     | Hamming weight calculator                |   ✗    |    ✓     |
| [**`pri_enc`**](./rtl/pri_enc.vhd)                       | Priority Encoder                         |   ✗    |    ✓     |
| [**`reg_4bits`**](./rtl/reg_4bits.vhd)                   | 4-bits Register                          |   ✗    |    ✓     |
| [**`reg`**](./rtl/reg.vhd)                               | 8-bits Register                          |   ✗    |    ✓     |
| [**`ripple_carry_4bits`**](./rtl/ripple_carry_4bits.vhd) | 4-bits Ripple Carry Adder                |   ✗    |    ✓     |
| [**`shift_reg`**](./rtl/shift_reg.vhd)                   | N-bits Shift Register                    |   ✗    |    ✓     |
| [**`t_ff`**](./rtl/t_ff.vhd)                             | T Flip-Flop                              |   ✗    |    ✓     |

## 📦 Structure

- **Directories**

    - [**`.vscode`**](./.vscode/) - Project specific VSCode settings (formatting and extensions)
    - [**`rtl`**](./rtl) - VHDL designs and circuits (`.vhd`)
    - [**`tb`**](./rtl) - VHDL test bench files
    - [**`doc`**](./doc/) - Documentation (*on its way, but not yet ...*)

- **Files**

    - `flake.nix` - Environment configuration (based on
    [**dev-templates**](https://github.com/the-nix-way/dev-templates))
    - `.envrc` - Used by **direnv** to load **Flakes**
    - `flake.lock` - Used by **Flakes** to version packages
    - `Makefile` - Used to automate checks and analyses

## 🔧 Tools

- [VSCodium](https://github.com/VSCodium/vscodium) - Code editor
- [GHDL](https://github.com/ghdl/ghdl) - VHDL 2008/93/87 simulator
- [VUnit](https://github.com/VUnit/vunit) - Testing framework for VHDL
- [NVC](https://github.com/nickg/nvc) - VHDL compiler & simulator
- [GTKWave](https://github.com/gtkwave/gtkwave) - Waveform viewer

## ✈️ Usage

1. All the files under `rtl/` and `tb/` can be imported in your synthesis tool (e.g Quartus or Vivado).
2. Optionally, you can use [GHDL](http://ghdl.free.fr/), which is a cross-platform open-source simulator for VHDL language, to simulate the circuits.
3. Install *GHDL* and *GTKWave* and add them to your `PATH`
4. Simulated results can be viewed using [GTKWave](http://gtkwave.sourceforge.net/) which is an open source waveform viewer.

### 🚀 Simulate

Run `make simulate ARCHNAME=tbname` to run the given testbench and display waveform using GTKWave where `tbname` is any of the testbench names inside the [tb](./tb/) directory.

```bash
$ make simulate ARCHNAME=tb_counter
>>> cleaning design...
>>> done...
>>> analyzing designs...
>>> simulating design: tb/tb_counter.vhd
tb/tb_counter.vhd:43:9:@510ns:(assertion note): completed
>>> showing waveform for: tb/tb_counter.vhd

GTKWave Analyzer v3.3.94 (w)1999-2018 BSI
...
```

`100us` stop time is given for simulation by default. Optional `STOPTIME=` argument can be passed to `Makefile` to change this value.

```bash
make simulate ARCHNAME=tb_counter STOPTIME=1ms
```

### 🧪 Check & Analyze

Run `make` on the root folder to check syntax and analyze all designs :

```bash
$ make
>>> check syntax on all designs...
>>> analyzing designs...
>>> completed...
```

> [!CAUTION]
> There should be **no errors** if you haven't changed anything.

## 📚 Resources

- My college classes
- This [old repo](https://github.com/fcayci/vhdl-digital-design) I've stumbled upon while searching for other similar repos
- This excellent [blog post](https://32954.digital/blog/2025/11/04/vhdl-environment-setup/#setup-on-linux) and how to set up a VHDL environment

## ✔️ To-do

- [ ] Implement test benches for all designs

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
