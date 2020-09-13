SELECT
airlines.Name as airline_name,
airlines.Country as airline_country,
routes.source_airport,
routes.source_airport_id,
routes.destination_airport,
routes.destination_airport_id
FROM routes
JOIN airlines
on routes.airline_id=airlines.airline_id