# booker-venue-svc

Микросервис управления заведениями, залами, столами и расписанием.

## Описание

Venue Service предоставляет gRPC API для:
- Управления заведениями (venues)
- Управления залами (rooms)
- Управления столами (tables)
- Управления расписанием (opening hours)
- Проверки доступности столов

## Запуск

```bash
go run cmd/venue-svc/main.go
```

## Миграции

```bash
# Накатить миграции
psql -U postgres -d booker -f migrations/001_venue_schema.sql
```

## Docker

```bash
docker build -t ghcr.io/bookingcontrol/booker-venue-svc:v1.0.0 .
```

## Зависимости

- `github.com/bookingcontrol/booker-contracts-go/v1` - Protobuf контракты
