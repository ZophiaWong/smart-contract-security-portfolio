Follow the guide in this [repo](https://github.com/Cyfrin/audit-report-templating)

## Requirement

- [pandoc](https://pandoc.org/installing.html)
- [Latex](https://www.latex-project.org/get/)
  - You might also have to install [one more package](https://github.com/Wandmalfarbe/pandoc-latex-template/issues/141) if you get File 'footnotebackref.sty' not found.

## Steps to get a professional-look report

1. Use `finding_layout.md` as you findings layout template, write your findings.
2. Add all your findings to a markdown file like `report-example.md`
3. Download `eisvogel.latex` and add to your templates directory (should be `~/.pandoc/templates/`)
4. Add your logo to the directory as a pdf named `logo-zp.pdf`
5. Run this command:
   ```bash
   pandoc report-example.md -o report.pdf --from markdown --template=eisvogel --listings
   ```
6. `report.pdf` would be your final result
