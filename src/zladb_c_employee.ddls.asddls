@EndUserText.label: 'Projection data model Employee'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'NumberIdentification' ]
define root view entity ZLADB_C_EMPLOYEE
  provider contract transactional_query
  as projection on zladb_r_employee
{
  key EmployeeUiid,
      EmployeeId,
      @ObjectModel.text.element: [ 'IdentificationText' ]
      TypeId,
      _Identification._Text.Text as IdentificationText : localized,
      NumberIdentification,
      FirstName,
      LastName,
      StartDate,
      BeginDate,
      City,
      @ObjectModel.text.element: [ 'CountryName' ]
      CountryId,
      _Country._Text.CountryName as CountryName        : localized,
      @Semantics.amount.currencyCode: 'Currency'
      Salary,
      Currency,      
      Content,
      @Search.defaultSearchElement: true
      PhotoName,
      Mimetype,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,

      /* Associations */
      _Currency,
      _EmployeeCargo : redirected to composition child ZLADB_C_EMP_CARGO,
      _Identification
//      _AttachEmp     : redirected to composition child ZLADB_C_ATTACH_EMP
}
