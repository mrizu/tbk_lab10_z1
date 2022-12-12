FROM node:alpine

WORKDIR /app
COPY src/ .

ENV MAX_ALLOCATION_MB=4096 \
    LOOP_ALLOCATION_MB=512 \
    LOOP_INTERVAL_MS=2000

HEALTHCHECK --interval=5s --timeout=3s --retries=3 --start-period=10s CMD ["node", "memory-check.js"]

CMD ["node", "memory-hog.js"]
