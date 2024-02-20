@EndUserText.label: 'Maintain Table for identification type T'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_TableForIdentifText
  as projection on ZI_TableForIdentifText
{
  @ObjectModel.text.element: [ 'LanguageName' ]
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'I_Language', 
      element: 'Language'
    }
  } ]
  key Spras,
  key TypeId,
  Text,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _LanguageText.LanguageName : localized,
  _TableForIdentificat : redirected to parent ZC_TableForIdentificat,
  _TableForIdentifiAll : redirected to ZC_TableForIdentificat_S
  
}
