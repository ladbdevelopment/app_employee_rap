@EndUserText.label: 'Maintain Table for identification type'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_TableForIdentificat
  as projection on ZI_TableForIdentificat
{
  key TypeId,
  LastChangedAt,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _TableForIdentifiAll : redirected to parent ZC_TableForIdentificat_S,
  _TableForIdentifText : redirected to composition child ZC_TableForIdentifText,
  _TableForIdentifText.Text : localized
  
}
