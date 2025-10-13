Follow the guide in this [repo](https://github.com/Cyfrin/audit-report-templating)

## Requirement

- [pandoc](https://pandoc.org/installing.html)
- [Latex](https://www.latex-project.org/get/)
  - You might also have to install [one more package](https://github.com/Wandmalfarbe/pandoc-latex-template/issues/141) if you get File 'footnotebackref.sty' not found.
  - For WSL2(Ubuntu 24.04.2 LTS): 
    - Installation:
      ```bash
      wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz

      tar -xvzf install-tl-unx.tar.gz
      cd install-tl-*

      sudo perl install-tl --no-interaction
      ```
    - Env Variables:
      ```bash
      echo 'export PATH=/usr/local/texlive/2025/bin/x86_64-linux:$PATH' >> ~/.bashrc
      source ~/.bashrc
      ```


## Steps to get a professional-look report

1. Use `finding_layout.md` as you findings layout template, write your findings.
2. Add all your findings to a markdown file like `report-example.md`
3. Download `eisvogel.latex` and add to your templates directory (should be `~/.pandoc/templates/`)
4. Add your logo to the directory as a pdf (for example, named `logo-zp.pdf`)
5. Make sure all the above files in same directory and run this command:
   ```bash
   pandoc report-example.md -o report-example.pdf --from markdown --template=eisvogel --syntax-highlighting=idiomatic
   ```
6. `report-example.pdf` would be your final result
