-- Get the accomplice's name
SELECT name FROM people
WHERE phone_number IN (
    SELECT receiver FROM phone_calls
    WHERE year = 2020 AND month = 7 AND day = 28
    AND caller = (
        SELECT phone_number FROM people WHERE name = "Ernest"
    )
    AND duration < 60
);
