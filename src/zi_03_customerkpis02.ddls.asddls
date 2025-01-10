@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CustomerKPIs'

define view entity ZI_03_CustomerKPIs02
  as select from Z03_I_TravelWithCustomer
{
  key CustomerId,
      Street,
      PostalCode,
      City,
      CustomerName,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum(TotalPrice + BookingFee)    as TotalRevenue,
      CurrencyCode,
      avg(Duration as abap.dec(16,0)) as AverageDuration,
      count(distinct AgencyId)        as NumberOfDifferentAgencys
}



group by
  CustomerId,
  CustomerName,
  Street,
  PostalCode,
  City,
  CurrencyCode
having
  sum(TotalPrice + BookingFee) > 50000
