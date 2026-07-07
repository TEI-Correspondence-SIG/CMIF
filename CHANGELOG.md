# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.1.0] - 2025-02-26

### Added
- Proposals for CMIF v1.1 and CMIF v2.
- Allow text in `correspAction/date`.
- Allow `@cert` and `@evidence` for `persName` & Co.
- Introduce additional Schematron file for CMIF.

### Changed
- `bibl/@xml:id` is now mandatory.
- Restrict `persName` & Co, `correspAction/@type` and content of `correspAction`.
- Updated documentation.
- Minor bugfixes & adjustments to current TEI Guidelines.

## [1.0.0] - 2023-05-08

### Added
- Initial stable release of the CMIF schema.
- Added `CITATION.cff` and citation recommendation in README.
- Add CMIF templates for digital and printed editions.
- Added documentation (English).

### Changed
- Updated schema to (almost) PureODD.
- Allowed multiple `publisher` elements.

### Fixed
- Various typos and minor adjustments to example files.
