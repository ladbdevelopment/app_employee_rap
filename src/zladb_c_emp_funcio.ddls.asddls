@EndUserText.label: 'Projection data model Function for cargo'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZLADB_C_EMP_FUNCIO
  as projection on zladb_i_emp_funcio
{
  key EmployeeUiid,
  key CargoUiid,
  key FunctionUiid,
      NameFunction,
      Description,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Employee      : redirected to ZLADB_C_EMPLOYEE,
      _EmployeeCargo : redirected to parent ZLADB_C_EMP_CARGO
}
