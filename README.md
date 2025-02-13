Cхема базы данных «Туризм»:
  Справочники:
        services (Перечень предоставляемых услуг)
        countries (Список стран)
        hotels (Список отелей)
        clients (Клиенты)
  Таблица переменной информации:
        tours (Заказы туров)
  Связи:
    tours.client_id → clients.id (клиент, который заказал тур)
    tours.service_id → services.id (какая услуга выбрана)
    tours.country_id → countries.id (в какую страну поездка)
    tours.hotel_id → hotels.id (какой отель забронирован, может быть NULL)
    hotels.country_id → countries.id (в какой стране расположен отель)

Особенности:
    ON DELETE CASCADE в countries и clients — удаление страны или клиента приведёт к удалению зависимых данных.
    ON DELETE SET NULL в hotels — если отель удалён, в tours.hotel_id останется NULL, чтобы не терять всю запись о туре.
    status имеет ограничения (CHECK), чтобы в базе данных были только корректные статусы.
