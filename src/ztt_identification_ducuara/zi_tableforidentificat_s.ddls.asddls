@EndUserText.label: 'Table for identification type Singleton'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_TableForIdentificat_S
  as select from I_Language
    left outer join ZLADB_IDENTIFI on 0 = 0
  composition [0..*] of ZI_TableForIdentificat as _TableForIdentificat
{
  key 1 as SingletonID,
  _TableForIdentificat,
  max( ZLADB_IDENTIFI.LAST_CHANGED_AT ) as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
