@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Identification Type Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_LADB_IDENTIFI
  as select from zladb_identifi
  association [0..*] to ZI_LADB_IDENTIFI_TEX as _Text on $projection.TypeId = _Text.TypeId
{
      @UI.textArrangement: #TEXT_ONLY
      @UI.lineItem: [{  importance: #HIGH }]
      @ObjectModel.text.association: '_Text'
  key type_id as TypeId,

      // Asociaciones
      _Text
}
