# 日常 · 个人生活记录

独立部署版提供完整网页和 `/api/cloud` 同源接口，不依赖 ChatGPT 登录。使用昵称和至少12位同步口令在不同设备间恢复记录；口令经过浏览器 PBKDF2 派生，数据库只保存二次哈希验证值。请自行保管口令。

## 项目文件

- `worker.js`：完整前端与后端，包含全部静态资源，直接部署到 Cloudflare Workers。
- `schema.sql`：数据库表、照片存储与请求频率限制。
- `wrangler.jsonc`：Worker 部署配置。
- `deployment-tests.mjs`：Node.js 24 自带 SQLite 的同步集成测试。
- `quiet-life-source.zip`：此前的完整 Sites 工程归档。

## 部署步骤

1. 在 Cloudflare 创建 D1 数据库，执行 `schema.sql`。
2. 创建 Worker，导入本 GitHub 仓库，入口为 `worker.js`，无需前端构建。
3. 给 Worker 添加 D1 绑定，变量名 `DB`，选择前面创建的数据库。
4. 部署后使用同一个 HTTPS 域名访问网页和 API。如使用 Wrangler 管理绑定，应将真实数据库 ID 和名称写入 `wrangler.jsonc`，不得放入 API 密钥。

浏览器照片会压缩后存入 D1，单张不超过约1MB，避免额外启用对象存储计费。体重、饮食、运动、睡眠、围度和账单保存在独立昵称档案中。操作先落本机，网络恢复后重试；版本检查保护不同设备的并发修改。记录和照片不会写入公开 GitHub 仓库。

`node deployment-tests.mjs` 验证实际 SQLite 持久保存、口令验证、版本冲突、照片读写、跨站限制和请求频率限制。

## 使用与迁移

新昵称首次创建时可带上当前设备已有记录。已有昵称需原同步口令。不同托管域名的浏览器缓存互相独立；从原 Sites 版迁移时，先在原站导出 JSON，再在独立站恢复并连接昵称。数据不自动从原站后台复制。

GitHub 用来维护源码；GitHub Pages 不能执行这个云端 API。部署到 Workers 或绑定自有域名后，仍需实测国内网络，不能仅凭平台名称保证可访问。原站仍可使用：https://quiet-life.spectre4976.chatgpt.site
