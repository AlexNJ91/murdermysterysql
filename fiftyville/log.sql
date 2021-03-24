-- Keep a log of any SQL queries you execute as you solve the mystery.
SELECT id FROM crime_scene_reports WHERE month = 7 AND day = 28 AND street = "Chamberlin Street"; --Query crime scene report table and produce case ID (295)
SELECT id FROM interviews WHERE month = 7 AND day = 28 --Retrieve interview statements from that day


SELECT person_id FROM bank_accounts-- Get person_id from the ATM transactions
JOIN atm_transactions ON atm_transactions.account_number = bank_accounts.account_number
WHERE atm_transactions.year = 2020 AND atm_transactions.month = 7 AND atm_transactions.day = 28
AND transaction_type = "withdraw"
AND atm_transactions.atm_location = "Fifer Street";

SELECT passport_number FROM passengers-- Get the passport numbers of passengers
WHERE flight_id IN (SELECT id FROM flights WHERE year = 2020 AND month = 7 AND day = 29 ORDER BY hour, minute ASC LIMIT 1);

-- Get the name of the thief
SELECT name FROM people WHERE people.license_plate IN (SELECT license_plate FROM courthouse_security_logs WHERE year = 2020 AND month = 7 AND day = 28 AND hour = 10 AND minute > 15 AND minute < 25);

-- Query ATM transactions
AND people.id IN (
    SELECT person_id FROM bank_accounts
    JOIN atm_transactions ON atm_transactions.account_number = bank_accounts.account_number
    WHERE atm_transactions.year = 2020 AND atm_transactions.month = 7 AND atm_transactions.day = 28 AND transaction_type = "withdraw" AND atm_transactions.atm_location = "Fifer Street");
    
    -- Query calls
AND people.phone_number IN (SELECT caller FROM phone_calls WHERE year = 2020 AND month = 7 AND day = 28 AND duration < 60);

-- Query first flight passenger list
AND people.passport_number IN (
    SELECT passport_number FROM passengers
    WHERE flight_id IN (
        SELECT id FROM flights WHERE year = 2020 AND month = 7 AND day = 29
        ORDER BY hour, minute ASC LIMIT 1
    );
    
-- Get the city name
SELECT city FROM airports WHERE id IN (SELECT destination_airport_id FROM flights WHERE year = 2020 AND month = 7 AND day = 29 ORDER BY hour, minute ASC LIMIT 1);

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