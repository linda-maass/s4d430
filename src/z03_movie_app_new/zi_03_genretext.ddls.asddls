@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Textelement for Genre'

define view entity ZI_03_GenreText as select from ZI_03_GenreVH
{
  key domain_name,
  key value_position,
  key language,
  Genre,
  GenreText
}
