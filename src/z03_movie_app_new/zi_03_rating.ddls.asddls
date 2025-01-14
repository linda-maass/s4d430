@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_03_RATING 
 as select from ZR_03_RATING
  association to parent ZI_03_MOVIE as _Movie on $projection.MovieUuid = _Movie.MovieUuid
{
  key RatingUuid,
  MovieUuid,
  UserName,
  Rating,
  RatingDate,
  
  
  _Movie
}
