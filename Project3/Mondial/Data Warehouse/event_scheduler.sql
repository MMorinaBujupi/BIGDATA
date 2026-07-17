
SET GLOBAL event_scheduler = ON;

DROP EVENT IF EXISTS refresh_mondial_dwh_event;

CREATE EVENT refresh_mondial_dwh_event
ON SCHEDULE EVERY 10 MINUTE
DO
    CALL refresh_mondial_dwh();