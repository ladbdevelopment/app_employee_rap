@EndUserText.label: 'Table for identification type'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_TableForIdentificat
  as select from ZLADB_IDENTIFI
  association to parent ZI_TableForIdentificat_S as _TableForIdentifiAll on $projection.SingletonID = _TableForIdentifiAll.SingletonID
  composition [0..*] of ZI_TableForIdentifText as _TableForIdentifText
{
  key TYPE_ID as TypeId,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _TableForIdentifiAll,
  _TableForIdentifText
  
}
