@EndUserText.label: 'Table for identification type Text'
@AccessControl.authorizationCheck: #CHECK
@ObjectModel.dataCategory: #TEXT
define view entity ZI_TableForIdentifText
  as select from ZLADB_IDENTIFIT
  association [1..1] to ZI_TableForIdentificat_S as _TableForIdentifiAll on $projection.SingletonID = _TableForIdentifiAll.SingletonID
  association to parent ZI_TableForIdentificat as _TableForIdentificat on $projection.TypeId = _TableForIdentificat.TypeId
  association [0..*] to I_LanguageText as _LanguageText on $projection.Spras = _LanguageText.LanguageCode
{
  @Semantics.language: true
  key SPRAS as Spras,
  key TYPE_ID as TypeId,
  @Semantics.text: true
  TEXT as Text,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _TableForIdentifiAll,
  _TableForIdentificat,
  _LanguageText
  
}
