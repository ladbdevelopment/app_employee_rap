@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Identification text Type Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_LADB_IDENTIFI_TEX
  as select from zladb_identifit
  association[1..1] to ZI_LADB_IDENTIFI as _IdType 
  on $projection.TypeId = _IdType.TypeId 
{
      @Semantics.language: true
  key spras                 as Spras,
      @ObjectModel.text.element: [ 'Text' ]
  key type_id               as TypeId,
      
      @Semantics.text: true
      text                  as Text,
      
      // Asociaciones 
      _IdType
  
}
