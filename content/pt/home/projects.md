---
# An instance of the Portfolio widget.
# Documentation: https://wowchemy.com/docs/page-builder/
widget: portfolio

# Ativar ou desativar a pagina
active: true

# This file represents a page section.
headless: true

# Order that this section appears on the page.
weight: 65

title: Projetos
subtitle: ''

content:
  # Page type to display. E.g. project.
  page_type: project

  # Default filter index (e.g. 0 corresponds to the first `filter_button` instance below).
  filter_default: 0

  # Filter toolbar (optional).
  # Add or remove as many filters (`filter_button` instances) as you like.
  # To show all items, set `tag` to "*".
  # To filter by a specific tag, set `tag` to an existing tag name.
  # To remove the toolbar, delete the entire `filter_button` block.
  filter_button:
  - name: Tudo
    tag: '*'
  - name: LEEM
    tag: LEEM
  - name: CDEC
    tag: CDEC
  - name: Rapidinhas do R
    tag: rapidinhar
  - name: statscience
    tag: statscience
  - name: meupacoter
    tag: meupacoter
  - name: midrangeMCP
    tag: midrangeMCP
  - name: MCPtests
    tag: MCPtests
  - name: SMR
    tag: SMR
  - name: UFSJ003(2019)
    tag: ufsj0032019
  - name: UFSJ004(2019)
    tag: ufsj0042019
  - name: UFSJ004(2020)
    tag: ufsj0042020
  - name: ProjAPE
    tag: projape
  - name: ConcEstat
    tag: conc_estat
  - name: CantEst
    tag: cantest

design:
  # Choose how many columns the section has. Valid values: '1' or '2'.
  columns: '2'

  # Toggle between the various page layout types.
  #   1 = List
  #   2 = Compact
  #   3 = Card
  #   5 = Showcase
  view: 2

  # For Showcase view, flip alternate rows?
  flip_alt_rows: false
---
