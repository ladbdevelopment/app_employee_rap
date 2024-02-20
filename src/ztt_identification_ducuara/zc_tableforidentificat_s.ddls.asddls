@EndUserText.label: 'Maintain Table for identification type S'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_TableForIdentificat_S
  provider contract transactional_query
  as projection on ZI_TableForIdentificat_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _TableForIdentificat : redirected to composition child ZC_TableForIdentificat
  
}
