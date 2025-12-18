# Project Object Lists

## Overview
This document provides a comprehensive list of all objects in the Employee RAP (RESTful ABAP Programming) application. The project manages employee information including their positions, functions, and identification types.

---

## Main Business Objects

### 1. Employee Management
- **Root Entity**: ZLADB_R_EMPLOYEE
- **Consumption Entity**: ZLADB_C_EMPLOYEE
- **Service Definition**: ZLADB_SD_EMPLOYEE
- **Service Binding**: ZLADB_SB_EMPLOYEE

### 2. Identification Type Management
- **Root Entity**: ZI_TABLEFORIDENTIFICAT_S
- **Consumption Entity**: ZC_TABLEFORIDENTIFICAT_S
- **Service Definition**: ZUI_TABLEFORIDENTIFICAT
- **Service Binding**: ZUI_TABLEFORIDENTIFICAT_O4

---

## Database Tables

### Employee Domain Tables
1. **ZLADB_EMPLOYEE_P** - Employee persistence table (active data)
2. **ZDLADB_EMPLOYEE** - Employee draft table
3. **ZLADB_EMP_CARGO** - Employee position/cargo table (active data)
4. **ZDLADB_EMP_CARGO** - Employee cargo draft table
5. **ZLADB_EMP_FUNCIO** - Employee function table (active data)
6. **ZDLADB_EMP_FUNCI** - Employee function draft table
7. **ZLADB_ATTACH_EMP** - Employee attachments table (active data)
8. **ZDLADB_ATTACH_EM** - Employee attachments draft table

### Identification Type Tables
1. **ZLADB_IDENTIFI** - Identification type table (active data)
2. **ZLADB_IDENTIF_1** - Identification type draft table
3. **ZLADB_IDENTIFIT** - Identification type text table (active data)
4. **ZLADB_IDENTIF_2** - Identification type text draft table
5. **ZLADB_IDENT_D_S** - Identification type singleton draft table

---

## Data Elements

1. **ZEMPLOYEE_ID_LADB** - Employee ID
2. **ZFIRST_NAME_LADB** - First name
3. **ZLAST_NAME_LADB** - Last name
4. **ZNUM_IDENTIFICATION** - Identification number
5. **ZTYPEID** - Type ID
6. **ZTYPETEXT** - Type text
7. **ZSALARY_AMOUNT** - Salary amount
8. **ZCONTENT_LADB** - Content (for attachments)
9. **ZFUNTION_DESCRIP** - Function description

---

## Domains

1. **ZNAME_EMPLOYEE** - Employee name domain
2. **ZTYPEID** - Type ID domain

---

## CDS Views (Data Definitions)

### Employee CDS Views
#### Interface Views (I)
1. **ZLADB_R_EMPLOYEE** - Root view for employee
2. **ZLADB_I_EMP_CARGO** - Interface view for employee cargo/position
3. **ZLADB_I_EMP_FUNCIO** - Interface view for employee function
4. **ZLADB_I_ATTACH_EMP** - Interface view for employee attachments

#### Consumption Views (C)
1. **ZLADB_C_EMPLOYEE** - Consumption view for employee
2. **ZLADB_C_EMP_CARGO** - Consumption view for employee cargo
3. **ZLADB_C_EMP_FUNCIO** - Consumption view for employee function
4. **ZLADB_C_ATTACH_EMP** - Consumption view for employee attachments

### Identification Type CDS Views
#### Interface Views (I)
1. **ZI_TABLEFORIDENTIFICAT_S** - Singleton interface view
2. **ZI_TABLEFORIDENTIFICAT** - Interface view for identification type
3. **ZI_TABLEFORIDENTIFTEXT** - Interface view for identification type text
4. **ZI_LADB_IDENTIFI** - Interface view for identification
5. **ZI_LADB_IDENTIFI_TEX** - Interface view for identification text

#### Consumption Views (C)
1. **ZC_TABLEFORIDENTIFICAT_S** - Singleton consumption view
2. **ZC_TABLEFORIDENTIFICAT** - Consumption view for identification type
3. **ZC_TABLEFORIDENTIFTEXT** - Consumption view for identification type text

---

## Metadata Extensions

### Employee Metadata Extensions
1. **ZLADB_ME_EMPLOYEE** - Metadata extension for employee
2. **ZLADB_ME_EMP_CARGO** - Metadata extension for employee cargo
3. **ZLADB_ME_EMP_FUNCIO** - Metadata extension for employee function
4. **ZLADB_ME_ATTACH_EMP** - Metadata extension for employee attachments

### Identification Type Metadata Extensions
1. **ZC_TABLEFORIDENTIFICAT** - Metadata extension for identification type
2. **ZC_TABLEFORIDENTIFICAT_S** - Metadata extension for identification type singleton
3. **ZC_TABLEFORIDENTIFTEXT** - Metadata extension for identification type text

---

## Behavior Definitions

### Employee Behavior Definitions
1. **ZLADB_R_EMPLOYEE** - Root behavior definition
   - Manages: Employee, Position, Function
   - Features: Draft handling, create, update, delete
   - Managed implementation with class ZBP_LADB_R_EMPLOYEE

2. **ZLADB_C_EMPLOYEE** - Consumption behavior definition (projection)
   - Exposes: Employee, Position, Function
   - Features: Draft actions (Edit, Resume, Activate, Discard, Prepare)

### Identification Type Behavior Definitions
1. **ZI_TABLEFORIDENTIFICAT_S** - Singleton behavior definition
   - Managed with additional save implementation
   - Class: ZBP_I_TABLEFORIDENTIFICAT_S
   - Features: Customizing transport request handling

2. **ZC_TABLEFORIDENTIFICAT_S** - Consumption behavior definition (projection)
   - Exposes customizing functionality

---

## Behavior Implementation Classes

1. **ZBP_LADB_R_EMPLOYEE** - Employee behavior implementation
   - File: zbp_ladb_r_employee.clas.abap
   - Locals: zbp_ladb_r_employee.clas.locals_imp.abap

2. **ZBP_I_TABLEFORIDENTIFICAT_S** - Identification type behavior implementation
   - File: zbp_i_tableforidentificat_s.clas.abap
   - Locals: zbp_i_tableforidentificat_s.clas.locals_imp.abap

3. **ZBP_C_TABLEFORIDENTIFICAT_S** - Consumption behavior implementation
   - File: zbp_c_tableforidentificat_s.clas.abap
   - Locals: zbp_c_tableforidentificat_s.clas.locals_imp.abap

---

## Service Definitions

1. **ZLADB_SD_EMPLOYEE** - Service definition for employee management
   - Exposes: Employee, Position, Function, Attachments

2. **ZUI_TABLEFORIDENTIFICAT** - Service definition for identification type management
   - Exposes: Identification types and texts

---

## Service Bindings

1. **ZLADB_SB_EMPLOYEE** - OData V4 service binding for employee
   - Service: ZLADB_SD_EMPLOYEE
   - Version: 0001

2. **ZUI_TABLEFORIDENTIFICAT_O4** - OData V4 service binding for identification types
   - Service: ZUI_TABLEFORIDENTIFICAT
   - Version: 0001

---

## Access Control (DCL)

### Employee Access Controls
1. **ZLADB_R_EMPLOYEE** - Access control for root employee view
2. **ZLADB_I_EMP_CARGO** - Access control for cargo view
3. **ZLADB_I_EMP_FUNCIO** - Access control for function view
4. **ZLADB_I_ATTACH_EMP** - Access control for attachments view

### Identification Type Access Controls
1. **ZI_TABLEFORIDENTIFICAT** - Access control for identification type
2. **ZI_TABLEFORIDENTIFTEXT** - Access control for identification text
3. **ZC_TABLEFORIDENTIFICAT** - Access control for consumption view
4. **ZC_TABLEFORIDENTIFTEXT** - Access control for text consumption view

---

## Fiori Elements Applications

1. **ZTABLEFORIDENTIFICAT** - List Report Object Page application
   - Configuration file: ztableforidentificat.smbc.json
   - Service: ZUI_TABLEFORIDENTIFICAT_O4
   - Root Entity Set: TableForIdentifiAll
   - Features: Object page with variant management

---

## Service Consumption Objects

1. **ZUI_TABLEFORIDENTIFICAT_O4_0001_G4BA** - Service consumption object
2. **ZLADB_SB_EMPLOYEE_0001_G4BA** - Service consumption object

---

## Package Structure

1. **Root Package** - Main package for employee management
2. **ZTT_IDENTIFICATION_DUCUARA** - Sub-package for identification type management

---

## Data Model Relationships

### Employee Hierarchy
```
ZLADB_R_EMPLOYEE (Employee)
├── ZLADB_I_EMP_CARGO (Position/Cargo)
│   └── ZLADB_I_EMP_FUNCIO (Function)
└── ZLADB_I_ATTACH_EMP (Attachments) [Commented out]
```

### Identification Type Hierarchy
```
ZI_TABLEFORIDENTIFICAT_S (Singleton)
└── ZI_TABLEFORIDENTIFICAT (Identification Type)
    └── ZI_TABLEFORIDENTIFTEXT (Text)
```

### Key Associations
- Employee → Currency (I_Currency)
- Employee → Identification Type (ZI_LADB_IDENTIFI)
- Employee → Country (I_Country)
- Position → Employee
- Function → Employee
- Function → Position

---

## Summary Statistics

- **Total Tables**: 13 (8 active + 5 draft)
- **Total CDS Views**: 14 interface + 7 consumption = 21
- **Total Behavior Definitions**: 4
- **Total Behavior Classes**: 3
- **Total Data Elements**: 9
- **Total Domains**: 2
- **Total Service Definitions**: 2
- **Total Service Bindings**: 2
- **Total Metadata Extensions**: 7
- **Total Fiori Apps**: 1

---

*Generated: 2025-12-18*
*Project: Employee RAP Application*
*Technology: SAP BTP ABAP Cloud Development*
