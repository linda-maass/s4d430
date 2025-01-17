@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Linda Maass'

@Metadata.allowExtensions: true
define root view entity ZC_04_FLIGHT
  provider contract transactional_query
  as projection on ZI_04_FLIGHT
{
  key CarrierId,
  key ConnectionId,
  key FlightDate,
      Price,
      CurrencyCode,
      PlaneTypeId,
      SeatsMax,
      SeatsOccupied,
      SeatUtilization,
     _Bookings: redirected to composition child ZC_04_BOOKING    

}

where
  FlightDate > $session.system_date
