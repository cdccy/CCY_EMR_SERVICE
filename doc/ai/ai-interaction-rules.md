# AI 交互规则

## 概述

本文档定义了 AI 工具（如 Cursor、Antigravity 或其他 AI 编码助手）在与本项目交互时的规则和指南。所有 AI 生成的内容和关键交互信息必须维护在 `doc/ai/` 目录中。

## 核心原则

### 1. 文档驱动开发
- **在进行任何更改之前，始终先阅读现有文档**
- **在实施更改后立即更新文档**
- **保持代码与文档之间的一致性**

### 2. 文件位置规则
- 所有 AI 交互日志和关键信息 → `doc/ai/`
- 所有 API 接口文档 → `doc/api-docs/`
- 所有数据库相关脚本 → `doc/sql/`
- 所有 Python 自动化脚本 → `doc/python/`

### 3. AI 工具读取协议

在进行任何更改之前，AI 工具必须：

1. **按顺序阅读以下文件**：
   - `README.md`（项目概述和结构）
   - `doc/ai/ai-interaction-rules.md`（本文档）
   - `doc/ai/project-analysis-report.md`（项目分析）
   - `doc/ai/project-setup-guide.md`（设置说明）

2. **理解 Git 子模块结构**：
   - 后端：主仓库 (`CCY_EMR_SERVICE`)
   - 前端：子模块 (`CCY_EMR_UI`)

3. **在实现新功能之前检查代码库中的现有模式**

### 4. AI 工具写入协议

在生成或修改内容时，AI 工具必须：

1. **在代码更改的同时创建/更新文档**
2. **对所有新文档文件使用英文文件名**
3. **遵循现有的文档结构和格式样式**
4. **包含对更改背后原因的详细解释**
5. **除非明确指示，否则保持向后兼容性**

### 5. 按工具类型的具体指南

#### 对于 Cursor/Antigravity 用户：
- 开始工作前始终检查 `doc/ai/` 目录
- 将所有提示、响应和关键决策保存为 `doc/ai/` 中的 `.md` 文件
- 使用描述性文件名（例如 `feature-user-authentication-implementation.md`）
- 在文档文件中包含时间戳和上下文

#### 对于 AI 编码助手：
- 当被要求修改代码时，首先通过检查相关文档来验证理解
- 如果文档缺失或过时，在继续之前创建/更新它
- 始终引用指导您实现的具体文档文件

## 文档模板

### 功能实现文档
```markdown
# [功能名称] 实现

## 上下文
- 为什么需要此功能
- 相关需求或用户故事

## 实现细节
- 技术方法
- 修改的关键文件
- 添加/删除的依赖项

## 测试策略
- 如何测试此功能
- 预期结果

## 参考
- 相关文档文件
- 受影响的 API 端点
```

### Bug 修复文档
```markdown
# [Bug 描述] 修复

## 问题陈述
- 什么出了问题
- 重现步骤

## 根本原因分析
- 问题的技术解释

## 解决方案
- 修复是如何实现的
- 更改的文件

## 验证
- 如何验证修复是否有效
```

## 版本控制指南

- **提交消息**应引用相关文档文件
- **拉取请求**应包含更新文档的链接
- **代码审查**应验证文档完整性

## 维护责任

- 保持 `doc/ai/` 目录井井有条且最新
- 适当地归档旧文档（不要删除，标记为已弃用）
- 确保所有团队成员理解和遵循这些规则

## 紧急程序

如果文档缺失或不清晰：
1. **停止**并请求澄清
2. **不要假设** - 请求明确指示
3. **在继续实施之前创建最小文档**

---

*本文档是 AI 工具与此项目交互的唯一真实来源。始终参考仓库中的最新版本。*

---

# AI Interaction Rules

## Overview

This document defines the rules and guidelines for AI tools (such as Cursor, Antigravity, or other AI coding assistants) when interacting with this project. All AI-generated content and key interaction information must be maintained in the `doc/ai/` directory.

## Core Principles

### 1. Document-Driven Development
- **Always read existing documentation first** before making any changes
- **Update documentation immediately** after implementing changes
- **Maintain consistency** between code and documentation

### 2. File Location Rules
- All AI interaction logs and key information → `doc/ai/`
- All API interface documentation → `doc/api-docs/`
- All database-related scripts → `doc/sql/`
- All Python automation scripts → `doc/python/`

### 3. Reading Protocol for AI Tools

Before making any changes, AI tools MUST:

1. **Read the following files in order**:
   - `README.md` (project overview and structure)
   - `doc/ai/ai-interaction-rules.md` (this file)
   - `doc/ai/project-analysis-report.md` (project analysis)
   - `doc/ai/project-setup-guide.md` (setup instructions)

2. **Understand the Git Submodule structure**:
   - Backend: Main repository (`CCY_EMR_SERVICE`)
   - Frontend: Submodule (`CCY_EMR_UI`)

3. **Check for existing patterns** in the codebase before implementing new features

### 4. Writing Protocol for AI Tools

When generating or modifying content, AI tools MUST:

1. **Create/update documentation simultaneously** with code changes
2. **Use English file names** for all new documentation files
3. **Follow the existing documentation structure** and formatting style
4. **Include detailed explanations** of the reasoning behind changes
5. **Maintain backward compatibility** unless explicitly instructed otherwise

### 5. Specific Guidelines by Tool Type

#### For Cursor/Antigravity Users:
- Always check `doc/ai/` directory before starting work
- Save all prompts, responses, and key decisions as `.md` files in `doc/ai/`
- Use descriptive file names (e.g., `feature-user-authentication-implementation.md`)
- Include timestamps and context in documentation files

#### For AI Coding Assistants:
- When asked to modify code, first verify understanding by checking relevant documentation
- If documentation is missing or outdated, create/update it before proceeding
- Always reference the specific documentation files that guided your implementation

## Documentation Templates

### Feature Implementation Documentation
```markdown
# [Feature Name] Implementation

## Context
- Why this feature is needed
- Related requirements or user stories

## Implementation Details
- Technical approach
- Key files modified
- Dependencies added/removed

## Testing Strategy
- How to test this feature
- Expected outcomes

## References
- Related documentation files
- API endpoints affected
```

### Bug Fix Documentation
```markdown
# [Bug Description] Fix

## Problem Statement
- What was broken
- Steps to reproduce

## Root Cause Analysis
- Technical explanation of the issue

## Solution
- How the fix was implemented
- Files changed

## Verification
- How to verify the fix works
```

## Version Control Guidelines

- **Commit messages** should reference relevant documentation files
- **Pull requests** should include links to updated documentation
- **Code reviews** should verify documentation completeness

## Maintenance Responsibilities

- Keep `doc/ai/` directory organized and up-to-date
- Archive old documentation appropriately (don't delete, mark as deprecated)
- Ensure all team members understand and follow these rules

## Emergency Procedures

If documentation is missing or unclear:
1. **STOP** and request clarification
2. **Don't assume** - ask for explicit instructions
3. **Create minimal documentation** before proceeding with implementation

---

*This document is the single source of truth for AI tool interactions with this project. Always refer to the latest version in the repository.*