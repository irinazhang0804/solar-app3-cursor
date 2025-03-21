
---

# AI协作高效指南

## Ⅰ. 需求描述规范
```markdown
/* 使用结构化模板 */
[功能模块]: 音乐播放器控件
[技术栈]: HTML5 Audio API + Vue3
[设计需求]:
1. 进度条波形可视化
2. 支持歌词同步高亮
3. 手机端手势控制（左滑切歌/右滑收藏）
[约束条件]:
- 兼容Safari 15+
- 包体积≤200KB
- 遵循WCAG 2.1标准
```

## Ⅱ. 代码生成技巧
```javascript
// 使用类型注释增强理解
/**
 * @typedef {Object} SolarTerm 节气数据结构
 * @property {string} name 节气名称
 * @property {Date} date 发生日期
 * @property {string} color 主题色
 */

// 明确函数输入输出
/** 
 * 生成节气时间轴SVG
 * @param {SolarTerm[]} terms 节气数据
 * @returns {SVGElement} 可交互的时间轴
 */

// ai代码生成策略
ai自行执行代码并修复问题，争取一次做对
```

## Ⅲ. 设计协作规范
```css
/* 标注设计系统变量 */
:root {
  /* 色彩系统 */
  --spring-primary: #A3D900; /* 主色-春 */
  --text-primary: rgba(0,0,0,0.87); /* 主要文字 */
  
  /* 动效曲线 */
  --ease-in-out: cubic-bezier(0.4, 0, 0.2, 1);
  
  /* 间距系统 */
  --space-unit: 8px;
}
```

## Ⅳ. 调试优化策略
```markdown
1. **错误定位**  
   "遇到TypeError: Cannot read property 'map' of undefined，  
   请检查第32行terms数据是否已初始化"

2. **性能优化**  
   "/对首页加载进行 Lighthouse 审计并给出优化建议"

3. **代码重构**  
   "/将节气卡片组件重构为Web Components"
```

## Ⅴ. 版本控制提示
```bash
# 生成commit message模板
feat(calendar): 实现节气时间线拖拽功能
- 新增Sortable.js集成
- 添加拖拽过程视觉反馈
- 修复移动端触摸事件冲突
```

## Ⅵ. 高效对话模式
| 场景                | 优质提问                                                                 | 低效提问                     |
|---------------------|--------------------------------------------------------------------------|------------------------------|
| 功能实现            | "如何用CSS Grid实现响应式节气卡片布局？需兼容IE11"                        | "怎么做卡片布局？"            |
| 错误排查            | "在Safari上audio元素报错NotSupportedError，Chrome正常，可能是什么原因？" | "音乐播不了怎么办？"          |
| 技术选型            | "对比IndexedDB和LocalStorage在离线节气数据存储的适用性"                  | "该用哪个存数据？"            |

## Ⅶ. 原型快速迭代流程
```markdown
1. 生成基础框架 → 
   "/创建节气详情页HTML骨架，包含插画区、文字区和诗词板块"

2. 填充设计细节 → 
   "/为诗词板块添加毛笔字迹动画"

3. 添加交互逻辑 → 
   "/实现滑动切换节气的手势检测"

4. 设计验证 → 
   "/检查深色模式下的对比度是否达标"

5. 生成文档 → 
   "/输出本组件的样式使用指南"
```

## Ⅷ. 技术备忘录模板
```markdown
### 待解决问题
- [ ] 移动端滑动切换卡顿
- [ ] 寒露节气插画缺失

### 技术决策记录
2023-08-20 选择Chart.js而非D3：  
✓ 更快的实现速度  
✓ 较小的包体积  
✗ 牺牲部分自定义能力

### 性能备忘录
| 模块          | 加载时间 | 优化建议               |
|---------------|----------|------------------------|
| 节气插画      | 1200ms   | 启用WebP格式+懒加载    |
| 诗词动画      | 800ms    | 减少关键帧数量         |
```

---

**使用建议**：
1. 将常用提示词保存为代码片段
2. 配合IDE插件实现快捷输入
3. 定期更新技术约束条件
4. 对复杂需求采用"分治策略"（分解为子任务）

该指南可减少70%的无效对话，提升原型开发速度3倍以上。根据具体项目需求，可扩展以下专项提示词：
- 无障碍开发指南
- 国际化(i18n)实施方案
- 埋点监控集成方案
- 安全加固checklist