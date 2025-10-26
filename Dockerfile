# Используем официальный образ WAHA как базовый
FROM devlikeapro/waha:latest

# Устанавливаем рабочую директорию
WORKDIR /app

# Создаем директории для сессий и медиа
RUN mkdir -p /app/.sessions /app/.media

# Устанавливаем переменные окружения по умолчанию
ENV WAHA_API_URL=http://localhost:3000
ENV WAHA_API_KEY=sha512:d4273065fd5d79963463cae272d31277c88b5c510c23460c5c31d72ea95705008bcb4ba25fb229d3e516714bbef2b902df03d43695f33a88f973664763677ca3
ENV NODE_ENV=production

# Открываем порт 3000
EXPOSE 3000

# Создаем пользователя для безопасности
RUN addgroup -g 1001 -S nodejs && \
    adduser -S waha -u 1001

# Меняем владельца директорий
RUN chown -R waha:nodejs /app/.sessions /app/.media

# Переключаемся на пользователя waha
USER waha

# Запускаем WAHA сервер
CMD ["npm", "start"]
