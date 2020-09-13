SELECT
airlines.Name as airline_name,
airlines.Country as airline_country,
-- routes.source_airport,
routes.source_airport_id as "from",
-- routes.destination_airport,
routes.destination_airport_id as "to"
FROM routes
JOIN airlines
on routes.airline_id=airlines.airline_id