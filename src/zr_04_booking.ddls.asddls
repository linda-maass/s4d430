@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'

define view entity ZR_04_BOOKING
  as select from /dmo/booking_m
{
  key travel_id       as TravelId,
  key booking_id      as BookingId,
      booking_date    as BookingDate,
      customer_id     as CustomerId,
      carrier_id      as CarrierId,
      connection_id   as ConnectionId,
      flight_date     as FlightDate,
      flight_price    as FlightPrice,
      currency_code   as CurrencyCode,
      booking_status  as BookingStatus,
      last_changed_at as LastChangedAt
}
