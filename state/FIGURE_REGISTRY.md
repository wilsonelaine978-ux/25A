# FIGURE_REGISTRY

> 本表按 CURRENT 绘图规划门禁建立。所有正式图必须由冻结数据/冻结参数重新生成，不使用生成式图片。核心数据图默认 Matplotlib，几何机理图优先 TikZ/Matplotlib，流程图 Graphviz。

## 统一视觉语义

- 白底；
- 主结论对象：唯一稳定强调色；
- 基线/次要候选：中性灰；
- 阈值/警戒：低饱和事件色 + 虚线；
- 可行/有效区间：浅填充并配合边界线；
- 颜色之外必须有线型、点型、纹理或直接标签作为第二编码；
- 正文按“最优点、边界、阈值、区间、误差”解释，不用“红线/蓝点”作为主要叙事。

## F00 全题技术路线图

- `figure_role`：技术路线
- `evidence_claim`：全文问题链是“公共运动学 → 有限目标完整遮蔽几何核 → Q1正向判定 → Q2/Q3/Q4逐级扩展 → Q5多导弹联合 → 全题验证”。
- `data`：无数值数据，仅冻结问题链。
- `implementation_engine`：Graphviz
- `visual_reference`：工作流 Graphviz 规则；开源 scientific-visualization-book 的信息层级原则。
- `final_structure`：横向紧凑主链 + Q2/Q3/Q4 分支后汇入 Q5，避免整页纵向长图。
- `paper_size_target`：约 0.88–0.92 textwidth。
- `status`：待重绘。

## F01 Q1 有限圆柱完整遮蔽几何机理

- `figure_role`：模型推导/几何机理
- `evidence_claim`：遮蔽对象是导弹到有限目标可见点的有限线段；烟幕必须对所有可见视线满足距离阈值，且线段端点约束会自动排除“烟幕在导弹后方/目标后方”的伪遮蔽。
- `geometry_construction`：导弹位置、有限圆柱、若干极值视线、烟幕球/二维截面圆、最近点投影、阈值半径。
- `implementation_engine`：TikZ/Matplotlib；优先 1×2：俯视投影 + 侧视/法平面。
- `github_visual_reference`：Expander/tikz-images；janosh/tikz；tikz-3dplot。
- `paper_visual_reference`：不使用任何 2025A 现成解图；仅迁移计算几何/科学论文常见的“主几何 + 辅助构造低权重 + 关键距离标注”语法。
- `secondary_encoding`：实线主视线/虚线辅助线/浅灰目标轮廓。
- `status`：待重绘。

## F02 Q1 阈值边界与数值认证

- `figure_role`：结果 + 验证
- `evidence_claim`：有效区间端点对应最坏距离越过 10 m 阈值；三级离散结果稳定，独立几何核误差远小于几何尺度。
- `data`：`问题1_正式计算结果.json`、`问题1_正式几何复核.csv`、`问题1_正式遮蔽区间.csv`。
- `final_structure`：主图为 $D_1(t)$ 阈值曲线/有效区间；右上 inset 或下方小图为三层时长收敛与独立几何误差。
- `implementation_engine`：Matplotlib。
- `paper_visual_reference`：grid refinement / numerical verification 文献中的“解量趋稳 + 误差分离”表达；Eça & Hoekstra, JCP 2014, DOI 10.1016/j.jcp.2014.01.006；Stern 等网格收敛讨论只迁移验证结构。
- `status`：需要从冻结参数确定性复评 $D(t)$ 后重绘；不重新优化。

## F03 Q2 候选盆地与最优策略稳定性

- `figure_role`：求解 + 验证
- `evidence_claim`：多个搜索机制在不同参数区域找到近似同水平优质解，最终冻结解处于稳定高质量盆地；双重退火对照略低但同量级。
- `data`：`问题2_全局候选.csv`、`问题2_算法记录.csv`、`问题2_精细化记录.csv`、`问题2_最优策略.csv`。
- `final_structure`：主图采用航向角–投放时刻散点，点的明度/大小编码时长，最终解单独强调；副图用算法来源的点区间/条带而非普通柱状图。
- `implementation_engine`：Matplotlib。
- `secondary_encoding`：不同算法点型；最终解空心/实心组合标记。
- `status`：待重绘。

## F04 Q2 有效区间与数值/几何复核

- `figure_role`：结果 + 验证
- `evidence_claim`：最优策略形成连续有效区间 [0.928734, 5.516793] s，L2/L3 和独立几何核下稳定。
- `data`：`问题2_遮蔽区间.csv`、`问题2_数值收敛补充.csv`、`问题2_几何校验.csv`。
- `final_structure`：时间区间主图 + 小型误差点图。
- `implementation_engine`：Matplotlib。
- `status`：待重绘。

## F05 Q3 三弹联合区间、独立贡献与边际饱和

- `figure_role`：核心结果/机制
- `evidence_claim`：联合区间 6.403160400 s 主要由前两弹连续覆盖形成；第 3 弹独立完整遮蔽时长为 0，且其小范围时序扰动不改变联合目标，说明当前结构存在边际饱和/冗余方向。
- `data`：`问题3_单弹独立遮蔽区间.csv`、`问题3_联合遮蔽区间.csv`、`问题3_最优策略.csv`、`问题3_时序边界审计.csv`、`问题3_主动边界搜索.csv`。
- `final_structure`：上：三弹独立区间与联合区间共享时间轴；下：对第三弹扰动的 $\Delta H_1$ 点图，并标出关键边界分支复现结果。
- `implementation_engine`：Matplotlib。
- `secondary_encoding`：烟幕1/2/3用线型/纹理区分，第三弹明确标“独立贡献 0”。
- `status`：优先重绘，作为修复 S-006 的核心证据。

## F06 Q4 三机时域接力机制

- `figure_role`：核心结果/机制
- `evidence_claim`：FY1、FY2、FY3 的独立有效区间互不重叠，联合并集与三段独立区间一致，因此主要协同机制是时间接力而非同时空间拼接。
- `data`：`问题4_单弹独立遮蔽区间.csv`、`问题4_联合遮蔽区间.csv`、`问题4_最优策略.csv`。
- `final_structure`：共享 x 轴的三行 interval strip + 一行 union；旁侧仅放三机关键参数短注。
- `implementation_engine`：Matplotlib。
- `status`：待重绘。

## F07 Q4 搜索增益与严格复算

- `figure_role`：求解 + 验证
- `evidence_claim`：结构化候选、联合 DE、块精修、时序后抛光依次承担不同尺度的改进；最终 L1/L2/L3 趋于稳定。
- `data`：`问题4_全局候选.csv`、`问题4_精细化记录.csv`、`问题4_时序后抛光记录.csv`、`问题4_数值收敛.csv`。
- `final_structure`：阶段化增益点线图 + 收敛 inset；不使用装饰性柱图。
- `implementation_engine`：Matplotlib。
- `status`：待重绘。

## F08 Q5 五机十五弹投放—起爆时序

- `figure_role`：决策/部署
- `evidence_claim`：五架无人机在 0–60 s 内形成分层投放与起爆安排，部分槽位在冻结联合解中边际贡献为 0。
- `data`：`问题5_策略明细.csv`、`问题5_逐弹标签审计.csv`。
- `final_structure`：5 行 UAV 时间轴；每弹用投放点→起爆点短连线，端点使用不同点型；零边际槽弱化显示并加直接标记。
- `implementation_engine`：Matplotlib。
- `status`：待重绘。

## F09 Q5 三导弹联合遮蔽与同时受干扰数量

- `figure_role`：核心结果/机制
- `evidence_claim`：M1/M2/M3 的有效区间发生双重/三重时间重叠，解释 $H_\Sigma>H_\cup$。
- `data`：`问题5_分导弹联合区间.csv`、`问题5_计算结果.json`。
- `final_structure`：上部三行 interval strip；下部同步阶梯函数 $N(t)\in\{0,1,2,3\}$，直接标三重重叠段。
- `implementation_engine`：Matplotlib。
- `status`：优先重绘。

## F10 Q5 逐弹边际贡献矩阵

- `figure_role`：验证/解释
- `evidence_claim`：不同烟幕对三枚导弹的边际贡献具有明显稀疏性，若干固定槽位为零边际，从而支持“固定三槽是连续参数化、零边际槽可视为冗余”的解释。
- `data`：`问题5_逐弹标签审计.csv`。
- `final_structure`：15×3 热力图或点阵矩阵；零贡献保持空白/浅灰；按 UAV 分组分隔。
- `implementation_engine`：Matplotlib。
- `status`：优先重绘，服务 S-007。

## F11 Q5 高维搜索改进来源与数值收敛

- `figure_role`：求解 + 验证
- `evidence_claim`：完整40维全局候选约 19 missile·s，块精修带来结构级提升，时序抛光只负责细尺度修正；最终 L2/L3 分量差均小。
- `data`：`问题5_候选严格复算.csv`、`问题5_局部精修记录.csv`、`问题5_时序后抛光记录.csv`、`问题5_数值收敛.csv`。
- `final_structure`：主图为 accepted improvement waterfall-like point path（不用传统彩色瀑布柱）；副图为 H1/H2/H3 在 L1–L3 的收敛线。
- `implementation_engine`：Matplotlib。
- `status`：待重绘。

## F12 全题统一验证图

- `figure_role`：验证
- `evidence_claim`：Q1–Q5 的数值分辨率误差和独立几何核差异均远小于最终结论尺度，且约束审计通过。
- `data`：各问数值收敛、几何校验 CSV/JSON。
- `final_structure`：左：各问最高两层时长差（log y）；右：独立几何核最大绝对差（log y），直接给绝对量，不先画“相对人为阈值比”。
- `implementation_engine`：Matplotlib。
- `paper_visual_reference`：数值验证/网格收敛论文的误差随加密下降表达，不机械套 CFD 图型。
- `status`：待重绘。

## 图形删改原则

- 旧图不因“已有”自动保留；
- 新图若不能支撑明确主张则删除；
- 同一结论不重复画三张；
- 核心主图优先组合“结果 + 解释/验证”，但每个子图职责必须单一；
- 最终图号在 LaTeX 总装时统一冻结。
