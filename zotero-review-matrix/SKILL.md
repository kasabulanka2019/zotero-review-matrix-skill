---
name: zotero-review-matrix
description: Organize Zotero collections and all nested subcollection items, metadata, notes, PDF or EPUB highlights, and annotations into a thematic literature review matrix, CSV, and literature review DOCX with GB/T 7714-2015 references. Use when the user asks to整理 Zotero collection 文献、笔记、高亮、批注, create a literature review matrix, annotated review table, Markdown matrix, CSV export, Word literature review, docx 文献综述, or research synthesis table from Zotero.
---

# Zotero Review Matrix

Use this skill to turn one Zotero collection and all of its nested subcollections into a thematic literature review package. The default output is a readable Markdown matrix, a UTF-8 CSV matrix, and a Word `.docx` literature review with GB/T 7714-2015 references.

## Required Reference

Before extracting fields or writing outputs, read these references:

- `references/review-matrix-schema.md` for matrix columns, evidence priority, uncertainty labels, and Markdown/CSV output rules.
- `references/literature-review-docx.md` for the DOCX literature review structure and synthesis writing rules.
- `references/gbt7714-2015.md` for reference list formatting and sorting rules.

## Workflow

1. Resolve the collection.
   - If the user gives an 8-character collection key, use it directly.
   - If the user gives a collection name, call `zotero_search_collections`.
   - If several collections match, ask the user which collection to use.

2. Build the recursive collection set.
   - Call `zotero_get_collections` to inspect the collection tree.
   - Include the target collection and every nested child collection under it, regardless of depth.
   - If the tree output is ambiguous, ask the user to confirm the collection branch before proceeding.

3. Read all included collections.
   - Call `zotero_get_collection_items` with `detail="summary"` for the target collection and each nested subcollection.
   - Exclude standalone attachments unless the user explicitly asks to include them.
   - Work with Zotero parent items as the matrix rows and literature review evidence base.
   - Deduplicate by Zotero item key first, then by DOI when duplicate metadata appears.
   - Every deduplicated parent item from the target collection tree must be summarized, even if it lives several levels below the target collection.

4. Gather evidence for each item.
   - Call `zotero_get_item_metadata` for title, creators, date, DOI, URL, abstract, tags, and publication details.
   - Call `zotero_get_notes` for child notes.
   - Call `zotero_get_annotations` for highlights, area annotations, and annotation comments.
   - Call `zotero_get_item_children` only when attachment keys are needed.
   - Use `zotero_get_pdf_outline`, `zotero_read_pdf_pages`, or `zotero_get_item_fulltext` only when metadata, notes, and annotations are insufficient.

5. Extract matrix fields.
   - Prefer user-authored notes and annotation comments.
   - Use highlights as evidence for findings, methods, concepts, and short excerpts.
   - Use abstracts and metadata as fallback evidence.
   - Do not fabricate missing research details.
   - Mark uncertainty with the labels from the schema reference.

6. Generate matrix outputs.
   - Return a Markdown matrix or compact Markdown synthesis in the conversation.
   - Save a CSV file in the current workspace unless the user specifies another path.
   - Use UTF-8 encoding and preserve the schema column order.
   - Keep CSV cells concise; use semicolons instead of multiline cells when possible.

7. Write the literature review DOCX.
   - Use the completed matrix as the factual substrate.
   - Organize the review by arguments, themes, mechanisms, methods, debates, and research gaps, not by Zotero item order.
   - Prefer "观点（作者，年份）" citation phrasing in Chinese prose.
   - Compare and synthesize groups of studies where possible.
   - Add a final `参考文献` section formatted as GB/T 7714-2015.
   - Put Chinese references before English references. Within each language group, sort by first author's surname or available author field.
   - Save a `.docx` file in the current workspace unless the user specifies another path.

## Output Guidance

For small collections, use one Markdown table with the default columns.

For large collections, use a compact Markdown summary table plus one short section per item. The CSV should still contain one row per parent item and all default columns.

Name generated files clearly, for example:

```text
zotero-review-matrix-<collection-name>.csv
zotero-review-matrix-<collection-name>.md
zotero-literature-review-<collection-name>.docx
```

## Evidence Discipline

Treat Zotero notes, comments, and highlights as evidence, not decoration. Preserve the user's own synthesis points when they are present.

If a field is absent from the available material, write `未提及`. If the field is important but needs additional manual reading, write `待补充`. If you infer a relationship from the collection name, abstract, or surrounding context, prefix it with `推断:`.

When using direct excerpts, keep them short and tied to the Zotero note, annotation, highlight, or abstract that supports them.

Do not let the DOCX literature review exceed the evidence. If the collection notes are thin, write a more cautious review and make the weak evidence points explicit.
