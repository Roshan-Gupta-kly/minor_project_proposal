# LaTeX Report Template (Thapathali Campus, DOECE)

This repository is a LaTeX template for **major/minor project** proposal, progress, and final reports.

## Quick Start

1. Edit project metadata in [vars.tex](vars.tex) (title, authors, supervisor, dates, etc.).
2. Write content in the chapter files under [src/chapters/](src/chapters/) and front/back matter under [src/frontmatter/](src/frontmatter/) and [src/backmatter/](src/backmatter/).
3. Build the PDF from [main.tex](main.tex).

## Build (Local)

### Requirements
- A LaTeX distribution: **MiKTeX** (Windows) or **TeX Live** (Linux/macOS)
- Recommended: `latexmk` (usually included with the distribution)

### Commands
From the project root:
- Clean: `latexmk -C main.tex`
- Build PDF: `latexmk -pdf main.tex`

Tip: If you build into the `build/` folder, use `latexmk -pdf -outdir=build main.tex`.

## Editing Guide

### Main entry
- [main.tex](main.tex) is the single entry point.
- It includes the front matter, chapters, appendices, and bibliography.

### Where to write
- Chapters: [src/chapters/](src/chapters/)
- Front matter (cover, certificate, abstract, ToC/LOF/LOT, etc.): [src/frontmatter/](src/frontmatter/)
- Back matter/appendices: [src/backmatter/](src/backmatter/)
- Figures: put images under [src/images/](src/images/) (e.g., [src/images/figures/](src/images/figures/))

### References (BibTeX)
- Add citations to [references.bib](references.bib)
- Compile with `latexmk` (it runs BibTeX automatically when needed).

### Glossaries (Acronyms/Symbols)
- Acronyms: [src/frontmatter/abbreviations.tex](src/frontmatter/abbreviations.tex)
- Symbols: [src/frontmatter/symbols.tex](src/frontmatter/symbols.tex)
- If lists are empty, run an extra build (glossaries need multiple passes): `latexmk -pdf main.tex` twice.

## Common Issues

- **ToC / List of Figures / List of Tables not updating**: clean and rebuild (`latexmk -C main.tex` then build). These lists are generated from auxiliary files.
- **Two PDFs**: you may have `main.pdf` (root build) and `build/main.pdf` (outdir build). Open the one you just built.
- Only glossary entries used in the text appear in the list. To force an entry to appear, use `\glsadd{key}`.
## Structure Reference

The Markdown files are a checklist/reference only (the actual report is written in LaTeX):
- [Draft](0_draft.md)
- [Proposal](1_proposal.md)
- [Progress Report](2_progress.md)
- [Final Report](3_final.md)

## Editor Recommendations

- VS Code + LaTeX Workshop, TeXstudio, or Overleaf will all work. For VS Code, configure LaTeX Workshop to run `latexmk`.
- Using VS Code, or Overleaf will make compilation easier. 
