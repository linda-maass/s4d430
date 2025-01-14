@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ABAP-CDS-07'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity ZI_03_CustomerWithTravelsNew
  as select from ZI_03_Customer
  association [0..*] to ZI_03_Travel as _Travels on ZI_03_Customer.CustomerId = _Travels.CustomerId

{
  key ZI_03_Customer.CustomerId,
      ZI_03_Customer.FirstName,
      ZI_03_Customer.LastName,
      ZI_03_Customer.Title,
      ZI_03_Customer.Street,
      ZI_03_Customer.PostalCode,
      ZI_03_Customer.City,
      ZI_03_Customer.CountryCode,

      _Travels



}

where
  CountryCode = 'DE'
