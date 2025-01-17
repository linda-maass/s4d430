@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'

@Metadata.allowExtensions: true
define view entity ZC_04_BOOKING
  as projection on ZI_04_BOOKING

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
   
      _Flight: redirected to parent ZC_04_FLIGHT
}
