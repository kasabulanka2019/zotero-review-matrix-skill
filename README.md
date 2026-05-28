# Zotero Review Matrix Skill

`zotero-review-matrix` is a Codex skill for turning a Zotero collection and all nested subcollections into:

- a thematic Markdown literature review matrix
- a UTF-8 CSV review matrix
- a Word `.docx` literature review

It is designed for research workflows that rely on Zotero metadata, notes, PDF/EPUB highlights, annotation comments, and collection structure.

## Features

- Reads a target Zotero collection and every nested subcollection.
- Summarizes every deduplicated Zotero parent item.
- Prioritizes Zotero notes, annotation comments, and highlights before abstracts or full text.
- Produces Markdown and CSV matrices with stable columns.
- Guides Codex to write a structured Chinese literature review `.docx`.
- Adds GB/T 7714-2015 style references, with Chinese references before English references.

## Requirements

- Codex with custom skills support.
- Zotero MCP configured and connected to the user's Zotero library.

This repository does not include Zotero data. It only contains the skill instructions.

## Install

### Windows

Clone this repository, then copy the skill folder:

```powershell
git clone https://github.com/kasabulanka2019/zotero-review-matrix-skill.git
Copy-Item -Recurse -Force ".\zotero-review-matrix-skill\zotero-review-matrix" "$env:USERPROFILE\.codex\skills\zotero-review-matrix"
```

Or run the install script from the cloned repository:

```powershell
.\install.ps1
```

Restart Codex or open a new Codex conversation so the skill list is refreshed.

### macOS/Linux

```bash
git clone https://github.com/kasabulanka2019/zotero-review-matrix-skill.git
cd zotero-review-matrix-skill
bash install.sh
```

Restart Codex or open a new Codex conversation so the skill list is refreshed.

## Usage

In Codex, ask:

```text
Use $zotero-review-matrix to turn my Zotero collection "<collection name>" into a Markdown matrix, CSV, and DOCX literature review.
```

In Chinese:

```text
用 zotero-review-matrix 把 Zotero collection「<collection name>」整理成主题综述矩阵、CSV 和文献综述 docx。
```

If you provide a collection key, the skill uses it directly. If you provide a collection name, Codex resolves it through Zotero MCP tools.

## Output

The skill asks Codex to generate files such as:

```text
zotero-review-matrix-<collection-name>.md
zotero-review-matrix-<collection-name>.csv
zotero-literature-review-<collection-name>.docx
```

## Notes

- The quality of the review depends on the quality of Zotero metadata, notes, annotations, and highlights.
- The skill instructs Codex not to invent missing research details.
- GB/T 7714-2015 formatting is generated from available Zotero metadata; incomplete metadata may produce incomplete references.
