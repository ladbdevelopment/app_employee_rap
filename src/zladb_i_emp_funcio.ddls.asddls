@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interfaces data model Function for cargo'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zladb_i_emp_funcio
  as select from zladb_emp_funcio
  association        to parent zladb_i_emp_cargo as _EmployeeCargo on  $projection.EmployeeUiid = _EmployeeCargo.EmployeeUiid
                                                                   and $projection.CargoUiid    = _EmployeeCargo.CargoUiid
  association [1..1] to zladb_r_employee         as _Employee      on  $projection.EmployeeUiid = _Employee.EmployeeUiid
{
  key employee_uiid         as EmployeeUiid,
  key cargo_uiid            as CargoUiid,
  key function_uiid         as FunctionUiid,
      name_function         as NameFunction,
      description           as Description,
      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.lastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,
      _Employee,
      _EmployeeCargo
}
