# Polyview Deploy

Polyview 项目的 Docker 部署方案，包含 Python 后端、计算节点管理、PostgreSQL 数据库及 Nginx 反向代理。

## 架构概览

```
┌─────────────────────────────────────────────────────────────┐
│                        Nginx (80/443)                       │
│  前端静态文件 | 反向代理 → app-backend / node-manager         │
└─────────────────────────────────────────────────────────────┘
         │                    │                    │
         ▼                    ▼                    ▼
┌──────────────┐    ┌──────────────────┐    ┌──────────────┐
│  app-backend │    │   node-manager   │    │   postgres   │
│     (5000)   │    │     (5200)       │    │    (5432)    │
│  Python主后端 │    │  Python 计算节点 │    │    数据库     │
└──────────────┘    └──────────────────┘    └──────────────┘
```

## 服务说明

| 服务 | 镜像 | 端口 | 说明 |
|------|------|------|------|
| **app-backend** | app-backend:20260203-v2 | 5000 | Python 主后端，提供 API、管理后台、3D 查看器等 |
| **node-manager** | node-manager:20260203-v2 | 5200 | Python 计算节点管理，负责 GPU 任务调度 |
| **postgres** | postgres:18-alpine | 5432 | PostgreSQL 数据库 |
| **nginx** | nginx:stable-alpine | 80, 443 | 反向代理、前端静态资源、SSL |

## 目录结构

```
polyview-deploy/
├── config/
│   ├── config.toml          # app-backend 配置
│   └── node-manager.toml    # node-manager 配置
├── data/
│   └── postgres/            # PostgreSQL 数据持久化
├── initdb/
│   ├── polyview_client.sql  # 客户端数据库初始化
│   └── polyview_gpu.sql     # 计算任务数据库初始化
├── nginx/
│   ├── certs/               # SSL 证书（启用 HTTPS 时使用）
│   ├── conf.d/
│   │   └── app.conf         # Nginx 站点配置
│   └── logs/                # 日志目录
├── nodejs/                  # 前端打包后的静态文件
├── .env                     # 环境变量（需自行创建）
├── docker-compose.yml
└── README.md
```

## 快速开始

### 1. 环境要求

- Docker
- Docker Compose 3.9+

### 2. 准备镜像

确保已构建或拉取以下镜像：

- `app-backend:20260203-v2`
- `node-manager:20260203-v2`

### 3. 配置环境变量

在项目根目录创建 `.env` 文件，参考示例：

```env
# 数据库
DB_USER=postgres
DB_PASSWORD=your_password
DB_NAME=postgres
DB_PORT=5432

# AWS（如使用 S3 等云服务）
AWS_ACCESS_KEY_ID=your_access_key
AWS_SECRET_ACCESS_KEY=your_secret_key
AWS_DEFAULT_REGION=ap-southeast-1
```

### 4. 修改配置文件

- **config/config.toml**：根据部署环境调整数据库 URL、Supabase、clientIP 等
- **config/node-manager.toml**：配置 GPU 服务器映射、数据库连接等

> 注意：若 `app-backend` 与 `node-manager` 在同一 compose 中，`task_serve` 和 `edit_url` 可改为 `http://node-manager:5200/` 等内部服务地址。

### 5. 启动服务

```bash
#Docker登录 GHCR
docker login ghcr.io -u o0pk2008

#输入Token
ghp_xxxxxxxxxxxxxxxxxxxx

#拉取镜像
docker compose pull

#启动服务
docker compose up -d

#停止整所有服务
docker compose down

#修改nginx使配置生效
docker compose restart nginx
```

### 6. 访问

- 前端页面：`http://localhost/`（根路径会重定向到 `/v2/`）

## Nginx 路由说明

| 路径 | 转发目标 |
|------|----------|
| `/` | 前端静态文件（nodejs） |
| `/manage/` | app-backend:5000 |
| `/viewer`, `/edit` | app-backend:5000 |
| `/static/` | app-backend:5000 |
| `/api/` | app-backend:5000 |
| `/manager_gpu/` | node-manager:5200 |
| 部分 API 路径（get_、upload、save_ 等） | app-backend:5000 |

## 启用 HTTPS

1. 将 SSL 证书放入 `nginx/certs/` 目录
2. 在 `docker-compose.yml` 中取消 SSL 证书挂载注释：

   ```yaml
   volumes:
     - ./nginx/certs:/etc/nginx/certs:ro
   ```

3. 取消 443 端口映射注释：`- "443:443"`
4. 在 `nginx/conf.d/app.conf` 中配置 SSL 监听块

## 数据持久化

- PostgreSQL 数据：`./data/postgres`
- 首次启动时，`initdb/` 下的 SQL 脚本会自动执行完成数据库初始化

## 常用命令

```bash
# 启动
docker compose up -d

# 停止
docker compose down

# 查看日志
docker compose logs -f

# 仅重启某个服务
docker compose restart app-backend
```

## 注意事项

1. **镜像版本**：`docker-compose.yml` 中使用的镜像标签为 `20260203-v2`，请根据实际构建版本修改
2. **数据库密码**：`.env` 中的 `DB_PASSWORD` 需与 `config.toml`、`node-manager.toml` 中的数据库 URL 一致（URL 中的密码需 URL 编码）
3. **GPU 映射**：`node-manager.toml` 中的 `ServerMappings` 需根据实际 GPU 服务器 IP 和端口配置
4. **敏感信息**：config 文件中可能包含 Supabase、JWT 等密钥，生产环境请妥善保管并避免提交到版本控制
