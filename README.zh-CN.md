# Zotero Review Matrix Skill

`zotero-review-matrix` 是一个面向科研写作的 Codex skill。它可以把 Zotero 中某个 collection 及其所有下级 collection 里的文献、笔记、高亮和批注整理成：

- Markdown 主题综述矩阵
- UTF-8 CSV 综述矩阵
- Word `.docx` 文献综述

这个 skill 适合用来处理已经在 Zotero 中分类、阅读和批注过的文献，尤其适合做中文论文写作、课题综述、开题报告、文献回顾和研究脉络梳理。

## 主要功能

- 递归读取目标 Zotero collection 及所有子 collection。
- 对所有去重后的 Zotero parent item 逐篇整理，不遗漏下级文件夹中的文献。
- 优先使用 Zotero 笔记、PDF/EPUB 高亮、批注评论，再参考摘要和元数据。
- 生成固定字段的 Markdown 和 CSV 综述矩阵。
- 引导 Codex 写出有条理的中文文献综述 `.docx`，避免简单逐篇罗列。
- 文献综述正文尽量采用“观点（作者，年份）”的写法。
- 文末生成 GB/T 7714-2015 格式参考文献。
- 参考文献排序规则为中文文献在前、英文文献在后，并按第一作者姓氏或作者字段排序。

## 适用场景

你可以在这些场景使用它：

- 想把一个 Zotero collection 整理成综述矩阵。
- 想根据 Zotero 笔记和高亮写一份文献综述初稿。
- 想把一个课题文件夹中的所有文献导出为 CSV，方便筛选和补充。
- 想让 Codex 根据文献观点、方法、发现和局限来组织综述正文。
- 想生成带 GB/T 7714-2015 参考文献的 Word 文档。

## 使用前提

- 已安装支持 custom skills 的 Codex。
- 已配置 Zotero MCP，并且 Codex 能访问你的 Zotero library。

这个仓库不包含任何 Zotero 数据，只包含 skill 指令和参考规则。使用者需要连接自己的 Zotero。

## 安装方法

### Windows

先克隆仓库：

```powershell
git clone https://github.com/kasabulanka2019/zotero-review-matrix-skill.git
cd zotero-review-matrix-skill
```

然后运行安装脚本：

```powershell
.\install.ps1
```

也可以手动复制：

```powershell
$target = "$env:USERPROFILE\.codex\skills\zotero-review-matrix"
Remove-Item -Recurse -Force $target -ErrorAction SilentlyContinue
Copy-Item -Recurse -Force ".\zotero-review-matrix" $target
```

安装后重启 Codex，或新开一个 Codex 会话，让 skill 列表重新加载。

### macOS / Linux

```bash
git clone https://github.com/kasabulanka2019/zotero-review-matrix-skill.git
cd zotero-review-matrix-skill
bash install.sh
```

安装后重启 Codex，或新开一个 Codex 会话。

## 使用方式

在 Codex 中可以这样说：

```text
用 zotero-review-matrix 把 Zotero collection「<collection 名称>」整理成主题综述矩阵、CSV 和文献综述 docx。
```

如果你知道 collection key，也可以直接给 key：

```text
用 zotero-review-matrix 整理 Zotero collection ABC12345，输出 Markdown、CSV 和 docx 文献综述。
```

如果你有明确的综述主题，最好一起提供：

```text
用 zotero-review-matrix 把 Zotero collection「数字贸易」整理成主题综述矩阵，并围绕“数字贸易对企业出口韧性的影响机制”写一份中文文献综述 docx。
```

## 默认输出

skill 会引导 Codex 生成类似这些文件：

```text
zotero-review-matrix-<collection-name>.md
zotero-review-matrix-<collection-name>.csv
zotero-literature-review-<collection-name>.docx
```

Markdown 适合快速阅读和修改，CSV 适合继续筛选和补充，DOCX 适合进入论文写作或开题报告流程。

## 默认矩阵字段

默认综述矩阵包含：

- 作者年份
- 标题
- 研究问题
- 理论/概念
- 数据/样本
- 方法
- 核心发现
- 贡献
- 局限
- 与我的主题关系
- 可引用摘录
- 我的笔记/批注
- DOI/URL

## 写作原则

这个 skill 会要求 Codex：

- 不凭空编造文献细节。
- 没有证据的字段标记为 `未提及` 或 `待补充`。
- 优先保留你的 Zotero 笔记、批注和高亮中的有效观点。
- 综述正文按主题和论点组织，而不是按文献顺序逐篇堆叠。
- 参考文献尽量根据 Zotero 元数据生成 GB/T 7714-2015 格式。

## 注意事项

- 输出质量取决于 Zotero 元数据、笔记、高亮和批注的质量。
- 如果 Zotero 条目的作者、年份、期刊、页码等字段不完整，参考文献也可能不完整。
- GB/T 7714-2015 格式由 Codex 根据可用 metadata 生成，正式投稿前建议人工核对。
- 大型 collection 可能需要较长时间处理。

## 仓库结构

```text
zotero-review-matrix-skill/
  README.md
  README.zh-CN.md
  install.ps1
  install.sh
  zotero-review-matrix/
    SKILL.md
    agents/
      openai.yaml
    references/
      review-matrix-schema.md
      literature-review-docx.md
      gbt7714-2015.md
```

## 许可证

MIT License
