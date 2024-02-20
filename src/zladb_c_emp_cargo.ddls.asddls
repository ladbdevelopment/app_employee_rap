@EndUserText.label: 'Projection data model Cargo for employee'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZLADB_C_EMP_CARGO
  as projection on zladb_i_emp_cargo
{
  key EmployeeUiid,
  key CargoUiid,
      Name,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Employee : redirected to parent ZLADB_C_EMPLOYEE,
      _EmpFunc  : redirected to composition child ZLADB_C_EMP_FUNCIO
}
