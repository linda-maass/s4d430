@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating'
@Metadata.allowExtensions: true
define view entity ZC_03_RATING as projection on ZI_03_RATING
{
  key RatingUuid,
  MovieUuid,
  UserName,
  Rating,
  RatingDate,
  /* Associations */
  _Movie: redirected to parent ZC_03_Movie
}
