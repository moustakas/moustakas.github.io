---
title: "Surveys and Data Releases"
description: "Surveys, atlases, and public data releases built for the community."
weight: 30
papers:
  - key: desi
    entries:
      - {id: 2026AJ....171..285D, note: "Principal author"}
      - 2024AJ....168...58D
  - key: fastspecfit
    entries:
      - "FastSpecFit: Spectrophotometric Modeling of"
      - title: "FastSpecFit: Fast spectral synthesis and emission-line fitting of DESI spectra"
        info: "<strong>J. Moustakas</strong>, J. Buhler, D. Scholte et al. 2023, Astrophysics Source Code Library, ascl:2308.005"
        bibcode: 2023ascl.soft08005M
  - key: legacysurveys
    entries:
      - title: "DESI Legacy Imaging Surveys: Data Releases 9 and 11"
        info: "D. Schlegel et al. 2026, in preparation"
      - 2019AJ....157..168D
  - key: sga
    entries:
      - "Siena Galaxy Atlas 2025"
      - 2023ApJS..269....3M
  - key: primus
    entries:
      - 2011ApJ...741....8C
      - 2013ApJ...767..118C
  - key: atlases
    entries:
      - 2006ApJS..164...81M
      - 2014ApJS..212...18B
---

<!-- DRAFT: TODO one or two sentences per project. -->

Much of my work goes into building surveys, atlases, and public data releases that the whole astronomical community can use.

## Siena Galaxy Atlas

{{< img src="software/sga2020-montage.jpg" alt="Montage of 42 color images of nearby galaxies from the Siena Galaxy Atlas" caption="A sample of galaxies from the Siena Galaxy Atlas 2020." >}}

A multiwavelength atlas of large, nearby galaxies built from the DESI Legacy Imaging Surveys (SGA-2020, and SGA-2025 in preparation). Built with the [SGA pipeline](/software/#siena-galaxy-atlas-sga).

- Data and documentation: [sga.readthedocs.io](https://sga.readthedocs.io/)

{{< papers "sga" >}}

## FastSpecFit Catalogs

{{< img src="software/fastspecfit-example-bgs.png" alt="FastSpecFit model of a DESI Bright Galaxy Survey target at redshift 0.0813: the broadband spectral energy distribution with photometry and a color image of the galaxy, the full DESI spectrum with its best-fitting model, and zoomed-in fits to four groups of emission lines." caption="FastSpecFit model of a DESI Bright Galaxy Survey galaxy at *z*=0.0813: the ultraviolet-to-infrared spectral energy distribution (top), the DESI spectrum (middle), and fits to the strongest emission lines (bottom)." >}}

Stellar-continuum and emission-line measurements for every extragalactic target in the DESI data releases, from [FastSpecFit](/software/#fastspecfit).

- Data and documentation: [fastspecfit.readthedocs.io](https://fastspecfit.readthedocs.io/)

{{< papers "fastspecfit" >}}

## DESI Data Releases

{{< img src="software/desi-y5-butterfly.jpg" alt="Two broad wedges made of thousands of tiny dots in shades of blue on a black background. A magnified inset reveals a filamentary network of galaxies." caption="The three-dimensional map of the universe from five years of DESI observations. Credit: Claire Lamman/DESI collaboration." >}}

The public spectroscopic data releases of the Dark Energy Spectroscopic Instrument, so far the Early Data Release (EDR) and Data Release 1 (DR1). I was the principal author of the DR1 paper.

- Data and documentation: [data.desi.lbl.gov/doc/releases](https://data.desi.lbl.gov/doc/releases/)

{{< papers "desi" >}}

## DESI Legacy Imaging Surveys

{{< img src="software/legacysurvey-dr11-depth-r.png" alt="All-sky map of r-band depth in Legacy Surveys DR11, labeled by contributing survey" caption="*r*-band depth of Legacy Surveys DR11, labeled by contributing survey." light=true >}}

The imaging used to select DESI targets, publicly released in Data Releases 1–11 (2015–2026).

- Data and documentation: [legacysurvey.org](https://www.legacysurvey.org/)

{{< papers "legacysurveys" >}}

## PRIMUS

The PRIsm MUlti-object Survey, a low-resolution spectroscopic survey of galaxies to redshift *z*∼1.

{{< papers "primus" >}}

## Spectrophotometric Atlases of Nearby Galaxies

Integrated optical spectra of nearby galaxies from my thesis, and an atlas of their ultraviolet-to-mid-infrared spectral energy distributions.

{{< papers "atlases" >}}
