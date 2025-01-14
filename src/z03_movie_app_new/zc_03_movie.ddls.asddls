@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie'
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_03_Movie
  provider contract transactional_query
as projection on ZI_03_MOVIE
{
  key MovieUuid,
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.7
  Title,
  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_03_GenreVH', element: 'Genre'} }]
  Genre,
  PublishingYear,
  RuntimeInMin,
  ImageUrl,
  CreatedAt,
  CreatedBy,
  LastChangedAt,
  LastChangedBy,
  
  AverageRating,
  AverageRatingCriticality,
  
  
  _Ratings: redirected to composition child ZC_03_RATING
  
}
