# 日常 · 个人生活记录（本地保存版）

纯 HTML / CSS / JavaScript 单页面应用，直接通过 GitHub Pages 发布。

所有体重、饮食、运动、睡眠、身体围度、备注与账单记录仅保存在当前浏览器。照片压缩后保存在 IndexedDB，记录保存在 localStorage。无昵称登录、无云同步、无 AI 接口、无需 Cloudflare。

## 使用

访问 GitHub Pages 地址即可记录。刷新不丢失；更换设备或浏览器不会自动同步。请在「我的」中定期导出完整 JSON 备份（含照片）。清除网站数据或使用无痕浏览可能丢失本机记录。

不同网站地址的浏览器数据互相独立。如从原站迁移，在原站导出 JSON，再在此站导入。

## 发布

仓库 Settings → Pages → Deploy from a branch → main → /(root) → Save。
首页为 `index.html`，不需要 npm 安装或构建，也不需要后端账户。

根目录的 Worker、数据库配置及旧源码压缩包来自此前云同步方案，属于历史归档；当前 GitHub Pages 只运行 index.html、app.js、core.js 与 style.css。

国内访问受网络环境影响，尚未进行国内多运营商验证。
