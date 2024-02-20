@EndUserText.label: 'Projection Attachment by employee'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZLADB_C_ATTACH_EMP
  as projection on zladb_i_attach_emp
{
  key EmployeeUiid,
  key AttachmentUuid,
      EmployeeId,
      @Search.defaultSearchElement: true
      PhotoName,
      Mimetype,
      Content,
      CreatedBy,
      CreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt
      /* Associations */
//      _Employee : redirected to parent ZLADB_C_EMPLOYEE
}
