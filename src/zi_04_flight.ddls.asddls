@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Linda Maass'

define root view entity ZI_04_FLIGHT
  as select from ZR_04_FLIGHT
  composition [0..*] of ZI_04_BOOKING as _Bookings
{
  key CarrierId,
  key ConnectionId,
  key FlightDate,
      Price,
      CurrencyCode,
      PlaneTypeId,
      SeatsMax,
      SeatsOccupied,
      @EndUserText.label: 'Seat Utilization'
      @EndUserText.quickInfo: 'SeatUtilization'


      cast(100 * (SeatsOccupied / SeatsMax) as abap.dec(16,2)) as SeatUtilization,
      _Bookings
}
