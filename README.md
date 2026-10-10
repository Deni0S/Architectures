# Architectural Patterns
[![Status](https://img.shields.io/badge/status-deprecated-red)](#)
[![Purpose](https://img.shields.io/badge/purpose-educational%20%2F%20history-blue)](#)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](./LICENSE)
[![Year](https://img.shields.io/badge/year-2020-lightgrey)](#)

> **This project is no longer maintained.**
> It is kept as educational material for reference and history.
> The code may be incomplete, outdated, or contain educational simplifications.

The project demonstrates end-to-end integration of three architectural patterns — **MVC**, **MVP**, and **VIPER** — into a single application.

## 🏗 Architectural Patterns

### 1. MVC (Model-View-Controller) — Base
A classic approach for a quick start. Used for simple static screens.  
**Problem:** as functionality grows, the Controller turns into a “Massive View Controller.”

### 2. MVP (Model-View-Presenter) — Optimization
The Presenter moves presentation logic out of the View, making the code testable.  
**Role:** a transitional bridge to the more complex VIPER structure.

### 3. VIPER — Strict Constraint
Each layer is isolated and responsible only for its own area:

- **V**iew — display only
- **I**nteractor — business logic only
- **P**resenter — communication only
- **E**ntity — data only
- **R**outer — navigation only

**Constraint:** VIPER forbids accessing the database from the View or triggering navigation from the Interactor.  
Architecture violations are blocked by the linter or compiler.