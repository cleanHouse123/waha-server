# WAHA Server

Этот проект содержит Dockerfile для создания образа WAHA сервера.

## Сборка образа

```bash
docker build -t dev-waha:latest .
```

## Запуск контейнера

```bash
docker run -d \
  --name waha-server \
  -p 3001:3000 \
  -v ./sessions:/app/.sessions \
  -v ./media:/app/.media \
  -e WAHA_API_URL=https://your-domain.com \
  -e WAHA_API_KEY=your-api-key \
  dev-waha:latest
```

## Переменные окружения

- `WAHA_API_URL` - URL для API (по умолчанию: http://localhost:3000)
- `WAHA_API_KEY` - API ключ для аутентификации
- `NODE_ENV` - Окружение (по умолчанию: production)

## Порты

- `3000` - Порт WAHA сервера внутри контейнера
- `3001` - Порт на хосте (можно изменить)

## Тома

- `./sessions:/app/.sessions` - Сессии WhatsApp
- `./media:/app/.media` - Медиа файлы

## Подключение к backend-mussor

После развертывания WAHA сервера, обновите переменные окружения в backend-mussor:

```env
WAHA_API_URL=https://your-waha-domain.com
WAHA_API_TOKEN=your-api-key

```
