# Architecture

## Infrastructure

- Cloud: E2E Networks
- One Linux Node (Ubuntu LTS)
- One Load Balancer (ports 80/443)
- Nginx on host (reverse proxy)

## Apps

| App         | Domain          | Blue Port | Green Port |
| ----------- | --------------- | --------- | ---------- |
| mooremarket | mooremarket.com | 3000      | 3001       |
| alphabit    | alphabit.com    | 4000      | 4001       |

## Flow

Users → Load Balancer (80/443) → Nginx (host) → Docker Containers

## Rules

1. CI must pass before CD
2. Blue-Green deployment only
3. Rollback = switch port (simpler than deploy)
4. No hardcoded secrets
5. /health endpoint required
