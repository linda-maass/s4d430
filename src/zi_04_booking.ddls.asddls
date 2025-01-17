@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'

define view entity ZI_04_BOOKING 
as select from ZR_04_BOOKING
 association to parent ZI_04_FLIGHT as _Flight on  $projection.CarrierId    = _Flight.CarrierId
                                                and $projection.ConnectionId = _Flight.ConnectionId
                                                and $projection.FlightDate   = _Flight.FlightDate
                                          
 {
  key TravelId,
  key BookingId,
  BookingDate,
  CustomerId,
  CarrierId,
  ConnectionId,
  FlightDate,
  FlightPrice,
  CurrencyCode,
  BookingStatus,
  LastChangedAt,
  
  _Flight
}
