
# Multi-stage build for production optimization
FROM node:18-alpine AS base

# Install dependencies only when needed
FROM base AS deps
RUN apk add --no-cache libc6-compat python3 make g++
WORKDIR /app

# Install server dependencies
COPY server/package*.json ./server/
RUN cd server && npm ci --only=production

# Install client dependencies
COPY client/package*.json ./client/
RUN cd client && npm ci --only=production

# Rebuild the source code only when needed
FROM base AS builder
WORKDIR /app
COPY --from=deps /app/server/node_modules ./server/node_modules
COPY --from=deps /app/client/node_modules ./client/node_modules
COPY . .

# Build client
RUN cd client && npm run build

# Production image, copy all the files and run the server
FROM base AS runner
WORKDIR /app

ENV NODE_ENV=production
ENV PORT=3001

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 taskmanager

# Copy server files
COPY --from=builder /app/server ./server
COPY --from=builder --chown=taskmanager:nodejs /app/client/dist ./client/dist

# Copy production files
COPY --from=builder /app/nginx.conf ./
COPY --from=builder /app/docker-compose.yml ./

USER taskmanager

EXPOSE 3001

CMD ["node", "server/index.js"]
