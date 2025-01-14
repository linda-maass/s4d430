@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Average Rating'

define view entity ZI_03_AverageRating
  as select from ZR_03_RATING
{
  key MovieUuid,
  @EndUserText: { label: 'Average Rating', quickInfo: 'Average Rating'}

      avg(Rating as abap.dec(4,1)) as AverageRating
}
group by
  MovieUuid
