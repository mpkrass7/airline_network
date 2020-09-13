setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(DBI)
con <- DBI::dbConnect(RSQLite::SQLite(), '../data/airplanes_db.db')


library(readr)
airlines <- read.table('../data/airlines.txt', sep=',', stringsAsFactors = F)
names(airlines) <- c('Airline_ID','Name','Alias','IATA',
                     'ICAO','Callsign', 'Country', 'Active')
DBI::dbWriteTable(con, 'airlines', airlines,overwrite=T)

airports <- read.table('../data/airports.txt', sep=',', stringsAsFactors = F)
names(airports) <- c(
  'Airport_ID','Name','City','Country','IATA',
  'ICAO','Latitude','Longitude','Altitude','Timezone','DST',
  'Tz_database','Type','Source'
  )
DBI::dbWriteTable(con, 'airports', airports,overwrite=T)

countries <- read.table('../data/countries.txt', sep=',', stringsAsFactors = F)
names(countries) <- c('name', 'iso_code', 'dafif_code')
DBI::dbWriteTable(con, 'countries', countries,overwrite=T)

planes <- read.table('../data/planes.txt', sep=',', stringsAsFactors = F)
names(planes) <- c('name', 'iata_code', 'icao_code')
DBI::dbWriteTable(con, 'planes', planes,overwrite=T)

routes <- read.table('../data/routes.txt', sep=',', stringsAsFactors = F)
names(routes) <- c('airline', 'airline_id', 'source_airport',
                      'source_airport_id', 'destination_airport',
                      'destination_airport_id', 'codeshare','stops',
                      'equipment')
DBI::dbWriteTable(con, 'routes', routes,overwrite=T)

