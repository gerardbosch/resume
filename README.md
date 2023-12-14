![Build Status](https://github.com/gerardbosch/resume/actions/workflows/deploy-pdf.yml/badge.svg)

# Resume

LaTeX source for my _résumé_.

[Click here](https://gerardbosch.github.io/resume) to see the up-to-date PDF version.

👆 The PDF is built and published on GitHub Pages using GitHub Actions :)

# How to build

## Option A: Local TeX Live distro

To do a local build of the TEX you need a TeX Live distribution with all the required packages (full-installation just
to be sure).
Then:

```shell
latexmk main.tex
```

That's it!

## Option B: Docker + VSCode Remote Containers

This repository includes a `.devcontainer` configuration to connect VSCode to a Docker image that comes with TeX Live
installed + LaTeX Workshop extension. This image is the same used by the CI pipeline to deploy the PDF.

You can open the project in VSCode, connect to the remote container and build the PDF within
there. **Note**: Make sure to select the `latexmkrc` recipe to build.

## Option C: Overleaf online

If you need to quickly get a managed environment to edit LaTeX documents, go for <https://overleaf.com>. It provides an
online editor with a TeX Live full installation, and you can build the PDFs from there. Keep an eye on the options as
this document needs to be built with LuaLaTeX.

The sad part is that (at the time of writing) the integration with Git is for paid plans only.

# Fork note

If you fork this repository to bootstrap your own resume keep in mind the following:

- The published page is connected to Google Analytics.

  - **If you pretend to use this feature** you should replace the
    `MEASUREMENT_ID` environment variable by your own. To do that, you can define it as a repository secret (**note**:
    this ID is not secret, but I defined it as such to not mess it with eventual forks).

  - **If you DON'T want to link it with analytics**, you should remove the script in the `index.html`:

    ```javascript
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=${MEASUREMENT_ID}"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', '${MEASUREMENT_ID}');
    </script>
    ```

    And the placeholder replacement step in the CI pipeline (See `.github/workflows`).

- The published page is using [DataUnlocker](https://dataunlocker.com/) to recover analytics traffic blocked by ad-blockers.

  - **If you pretend to use this feature**, you need to define a repository secret `DATA_UNLOCKER_PROP_ID` with the
    property value provided by DataUnlocker.

  - **If you DON'T need/want this feature**, just remove the whole step from the CI pipeline (See `.github/workflows`).
