# 门诊流程活跃-历史拆分执行说明（REGISTERED 版）

## 状态模型

- `registration.reg_status`（挂号状态，仅2种）
  - `REGISTERED`：已挂号
  - `CANCELLED_UNSEEN`：未就诊取消
- `outpatient_visit_active.visit_status`（就诊状态，仅3种）
  - `REGISTERED`：待就诊（已进入就诊流程）
  - `IN_CONSULTATION`：就诊中
  - `COMPLETED`：就诊完成（触发归档后会从 active 删除）

## 执行顺序

1. 执行 `doc/sql/outpatient_visit_active_history_migration.sql`
2. 执行 `doc/sql/outpatient_visit_active_history_test.sql`
3. 对照测试脚本中的“预期”检查结果

## 核心触发器行为

- `registration` 插入（`REGISTERED`）后自动创建一条 `outpatient_visit_active`（`REGISTERED`）
- `outpatient_visit_active` 插入后自动创建一条 `outpatient_encounter_data`（`{}`）
- `REGISTERED -> IN_CONSULTATION -> COMPLETED` 是唯一允许的就诊流转
- `COMPLETED` 时归档到 `outpatient_visit_history`，并删除 `active + encounter`
- `REGISTERED -> CANCELLED_UNSEEN` 时，仅允许在 active 仍为 `REGISTERED` 时删除 `active + encounter`；若已进入就诊流程则报错

## 一致性与回滚

- 触发器与主语句同事务执行，触发器报错会导致整条语句回滚。
- 不会出现“挂号成功但 active/encounter 缺失”的半成功状态。

## 并发与防重

- `reg_code` 与 `visit_code` 都由数据库函数生成并由唯一约束兜底。
- 插入 active / encounter 时有幂等保护（`ON CONFLICT`）。

## 历史数据防篡改

- `outpatient_visit_history` 禁止 `UPDATE/DELETE`，仅允许 `INSERT`。
 