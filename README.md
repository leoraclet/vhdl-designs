# VHDL Designs

> A collection of VHDL designs I've built during my studies as exercises and projects.

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
> I've made this repo to regroup all those files I've made over the years in one place and make it available to others who might want examples.

This directory contains a collection of **VHDL designs** built for common logic functions and components.

These designs are reusable and suitable for a variety of computing and electronics projects, and they were build during my computer science and electronics classes as part of my engineering degree.

## 🙏 Acknowledgements

- [VHDL Digital Design](https://github.com/fcayci/vhdl-digital-design) - Took inspiration for the Makefile and some VHDL sources. I've stumbled upon this repo while re-structuring this one and looking for already existing ones.

## 🧩 Designs

> [!WARNING]
> Soon ...

## 📦 Structure

> [!WARNING]
> Soon ...

## 🔧 Tools

- [VSCodium](https://github.com/VSCodium/vscodium) - Code editor
- [GHDL](https://github.com/ghdl/ghdl) - VHDL 2008/93/87 simulator
- [VUnit](https://github.com/VUnit/vunit) - Testing framework for VHDL
- [NVC](https://github.com/nickg/nvc) - VHDL compiler & simulator
- [GTKWave](https://github.com/gtkwave/gtkwave) - Waveform viewer

## ✈️ Usage

- All the files under `rtl/` and `tb/` can be imported in your synthesis tool (e.g Quartus or Vivado).
- Optionally, you can use GHDL, which is a cross-platform open-source simulator for VHDL language, to simulate the circuits.
- Simulated results can be viewed using GTKWave which is an open source waveform viewer.

### 🚀 Simulate

Run `make simulate ARCHNAME=tbname` to run the given testbench and display waveform using GTKWave where `tbname` is any of the testbench names inside the [tb](./src/tb/) directory.

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

- [ ] Implement test bench for all designs
- [ ] Comment all designs
    - [ ] Complete descriptions
    - [ ] Explain design decisions
- [ ] Automate testing and analysis through a `Makefile`

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
