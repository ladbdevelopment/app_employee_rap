@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Attachment by employee'
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zladb_i_attach_emp
  as select from zladb_attach_emp
  //association to parent zladb_r_employee as _Employee on $projection.EmployeeUiid = _Employee.EmployeeUiid

{
  key employee_uiid         as EmployeeUiid,
  key attachment_uuid       as AttachmentUuid,
      employee_id           as EmployeeId,
      
      @Semantics.largeObject: {
                          mimeType: 'Mimetype',
                          fileName: 'PhotoName',
                          acceptableMimeTypes: ['image/png', 'image/jpeg'],
                          contentDispositionPreference: #INLINE
                        }
      content               as Content,
      name                  as PhotoName,
      
      @Semantics.mimeType: true
      mimetype              as Mimetype,

      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt

      // Asociaciones
//      _Employee
}
