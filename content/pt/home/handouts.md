---
# An instance of the Portfolio widget.
# Documentation: https://wowchemy.com/docs/page-builder/
widget: portfolio

# Ativar ou desativar a pagina
active: true

# This file represents a page section.
headless: true

# Order that this section appears on the page.
weight: 69

title: Apostilas
subtitle: ''

content:
  # Page type to display. E.g. project.
  page_type: handouts

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
  - name: EPAEC
    tag: epaec
  - name: INFBAYES
    tag: infbayes
  - name: INFII
    tag: infII
  - name: AMC
    tag: amc
  - name: TCL/TK
  - tag: tcltk
  - name: ESTEXP
    tag: estexp
  - name: AEUR/NEFIT
    tag: aeur-nefit
  - name: AEUR/FISIO
    tag: aeur-fisio
  - name: RPKG
    tag: rpkg



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
