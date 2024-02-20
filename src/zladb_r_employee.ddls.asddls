@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interfaces data model Employee'
define root view entity zladb_r_employee
  as select from zladb_employee_p
  composition [0..*] of zladb_i_emp_cargo as _EmployeeCargo
  //  composition [0..*] of zladb_i_attach_emp as _AttachEmp
  association [0..1] to I_Currency        as _Currency       on $projection.Currency = _Currency.Currency
  association [0..1] to ZI_LADB_IDENTIFI  as _Identification on $projection.TypeId = _Identification.TypeId
  association [0..1] to I_Country         as _Country        on $projection.CountryId = _Country.Country


{
  key employee_uiid         as EmployeeUiid,
      employee_id           as EmployeeId,
      type_id               as TypeId,
      number_identification as NumberIdentification,
      first_name            as FirstName,
      last_name             as LastName,
      start_date            as StartDate,
      begin_date            as BeginDate,
      city                  as City,
      country_id            as CountryId,
      @Semantics.amount.currencyCode: 'Currency'
      salary                as Salary,
      currency              as Currency,
      @Semantics.largeObject: {
                    mimeType: 'Mimetype',
                    fileName: 'PhotoName',
                    acceptableMimeTypes: ['image/png', 'image/jpeg'],
                    contentDispositionPreference: #INLINE
                  }
      content               as Content,
      photoname             as PhotoName,

      @Semantics.mimeType: true
      mimetype              as Mimetype,

      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,

      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,

      @Semantics.user.lastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,

      @Semantics.systemDateTime.lastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,

      // Asociaciones
      _EmployeeCargo,
      _Currency,
      _Identification,
      _Country
      //      _AttachEmp
}
