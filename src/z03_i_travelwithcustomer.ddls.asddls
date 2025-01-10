@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ABAP-CDS-03'

define view entity Z03_I_TravelWithCustomer
  as select from /dmo/customer
    inner join   /dmo/travel                                                   on /dmo/customer.customer_id = /dmo/travel.customer_id
    inner join   DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: '/DMO/STATUS' ) on  /dmo/travel.status                     = DDCDS_CUSTOMER_DOMAIN_VALUE_T.value_low
                                                                               and DDCDS_CUSTOMER_DOMAIN_VALUE_T.language = $session.system_language
{
  key /dmo/travel.travel_id                                               as TravelId,
      /dmo/customer.first_name                                            as FirstName,
      /dmo/customer.last_name                                             as LastName,
      /dmo/customer.title                                                 as Title,
      /dmo/customer.street                                                as Street,
      /dmo/customer.postal_code                                           as PostalCode,
      /dmo/customer.city                                                  as City,
      /dmo/customer.customer_id                                           as CustomerId,

      concat_with_space(
      case when /dmo/customer.title is initial then /dmo/customer.first_name
      else concat_with_space(/dmo/customer.title, /dmo/customer.first_name, 1)
      end, /dmo/customer.last_name, 1)                                    as CustomerName,

      /dmo/travel.agency_id                                               as AgencyId,
      /dmo/travel.begin_date                                              as BeginDate,
      /dmo/travel.end_date                                                as EndDate,


      dats_days_between(/dmo/travel.begin_date, /dmo/travel.end_date) + 1 as Duration,



      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount => /dmo/travel.booking_fee,
      source_currency => /dmo/travel.currency_code,
      target_currency => $projection.CurrencyCode,
      exchange_rate_date => /dmo/travel.begin_date,
      error_handling => 'KEEP_UNCONVERTED' )                              as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount => /dmo/travel.total_price,
      source_currency => /dmo/travel.currency_code,
      target_currency => $projection.CurrencyCode,
      exchange_rate_date => /dmo/travel.begin_date,
      error_handling => 'KEEP_UNCONVERTED')                               as TotalPrice,
      cast('EUR' as abap.cuky)                                            as CurrencyCode,



      /dmo/travel.status                                                  as Status,
      DDCDS_CUSTOMER_DOMAIN_VALUE_T.text                                  as StatusText,
      /dmo/travel.description                                             as Description
}

where
  /dmo/customer.country_code = 'DE'
  
  
  
  
  
  
