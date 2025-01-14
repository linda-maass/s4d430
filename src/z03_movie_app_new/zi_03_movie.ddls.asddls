@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie'
define root view entity ZI_03_MOVIE
as select from ZR_03_MOVIE_APP_NEW
association [0..1] to  ZI_03_AverageRating as _AverageRating on $projection.MovieUuid = _AverageRating.MovieUuid
 composition [0..*] of ZI_03_RATING as _Ratings
 
{
  key MovieUuid,
  Title,
  Genre,
  PublishingYear,
  RuntimeInMin,
  ImageUrl,
  CreatedAt,
  CreatedBy,
  LastChangedAt,
  LastChangedBy,
  
  _AverageRating.AverageRating as AverageRating,
  case when $projection.AverageRating > 6.7 then 3 
        when $projection.AverageRating > 3.4 then 2
        when $projection.AverageRating > 0 then 1
        else 0
    end as AverageRatingCriticality, 
  
  _Ratings,
  _AverageRating
}
