CLASS LHC_ZI_TABLEFORIDENTIFICAT_S DEFINITION FINAL INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      AUGMENT_TABLEFORIDENTIFICAT FOR MODIFY
        IMPORTING
          ENTITIES_CREATE FOR CREATE TableForIdentifiAll\_TableForIdentificat
          ENTITIES_UPDATE FOR UPDATE TableForIdentificat.
ENDCLASS.

CLASS LHC_ZI_TABLEFORIDENTIFICAT_S IMPLEMENTATION.
  METHOD AUGMENT_TABLEFORIDENTIFICAT.
    DATA: text_for_new_entity      TYPE TABLE FOR CREATE ZI_TableForIdentificat\_TableForIdentifText,
          text_for_existing_entity TYPE TABLE FOR CREATE ZI_TableForIdentificat\_TableForIdentifText,
          text_update              TYPE TABLE FOR UPDATE ZI_TableForIdentifText.
    DATA: relates_create TYPE abp_behv_relating_tab,
          relates_update TYPE abp_behv_relating_tab,
          relates_cba    TYPE abp_behv_relating_tab.
    DATA: text_tky_link  TYPE STRUCTURE FOR READ LINK ZI_TableForIdentificat\_TableForIdentifText,
          text_tky       LIKE text_tky_link-target.

    LOOP AT entities_create INTO DATA(entity).
      DATA(tabix) = sy-tabix.
      LOOP AT entity-%TARGET ASSIGNING FIELD-SYMBOL(<target>).
        APPEND tabix TO relates_create.
        INSERT VALUE #( %CID_REF = <target>-%CID
                        %IS_DRAFT = <target>-%IS_DRAFT
                          %KEY-TypeId = <target>-%KEY-TypeId
                        %TARGET = VALUE #( (
                          %CID = |CREATETEXTCID{ tabix }_{ sy-tabix }|
                          %IS_DRAFT = <target>-%IS_DRAFT
                          Spras = sy-langu
                          Text = <target>-Text
                          %CONTROL-Spras = if_abap_behv=>mk-on
                          %CONTROL-Text = <target>-%CONTROL-Text ) ) )
                     INTO TABLE text_for_new_entity.
      ENDLOOP.
    ENDLOOP.
    MODIFY AUGMENTING ENTITIES OF ZI_TableForIdentificat_S
      ENTITY TableForIdentificat
        CREATE BY \_TableForIdentifText
        FROM text_for_new_entity
        RELATING TO entities_create BY relates_create.

    IF entities_update IS NOT INITIAL.
      READ ENTITIES OF ZI_TableForIdentificat_S
        ENTITY TableForIdentificat BY \_TableForIdentifText
          FROM CORRESPONDING #( entities_update )
          LINK DATA(link).
      LOOP AT entities_update INTO DATA(update) WHERE %CONTROL-Text = if_abap_behv=>mk-on.
        tabix = sy-tabix.
        text_tky = CORRESPONDING #( update-%TKY MAPPING
                                                        TypeId = TypeId
                                    ).
        text_tky-Spras = sy-langu.
        IF line_exists( link[ KEY draft source-%TKY  = CORRESPONDING #( update-%TKY )
                                        target-%TKY  = CORRESPONDING #( text_tky ) ] ).
          APPEND tabix TO relates_update.
          APPEND VALUE #( %TKY = text_tky
                          %CID_REF = update-%CID_REF
                          Text = update-Text
                          %CONTROL = VALUE #( Text = update-%CONTROL-Text )
          ) TO text_update.
        ELSEIF line_exists(  text_for_new_entity[ KEY cid %IS_DRAFT = update-%IS_DRAFT
                                                          %CID_REF  = update-%CID_REF ] ).
          APPEND tabix TO relates_update.
          APPEND VALUE #( %TKY = text_tky
                          %CID_REF = text_for_new_entity[ %IS_DRAFT = update-%IS_DRAFT
                          %CID_REF = update-%CID_REF ]-%TARGET[ 1 ]-%CID
                          Text = update-Text
                          %CONTROL = VALUE #( Text = update-%CONTROL-Text )
          ) TO text_update.
        ELSE.
          APPEND tabix TO relates_cba.
          APPEND VALUE #( %TKY = CORRESPONDING #( update-%TKY )
                          %CID_REF = update-%CID_REF
                          %TARGET  = VALUE #( (
                            %CID = |UPDATETEXTCID{ tabix }|
                            Spras = sy-langu
                            %IS_DRAFT = text_tky-%IS_DRAFT
                            Text = update-Text
                            %CONTROL-Spras = if_abap_behv=>mk-on
                            %CONTROL-Text = update-%CONTROL-Text
                          ) )
          ) TO text_for_existing_entity.
        ENDIF.
      ENDLOOP.
      IF text_update IS NOT INITIAL.
        MODIFY AUGMENTING ENTITIES OF ZI_TableForIdentificat_S
          ENTITY TableForIdentifText
            UPDATE FROM text_update
            RELATING TO entities_update BY relates_update.
      ENDIF.
      IF text_for_existing_entity IS NOT INITIAL.
        MODIFY AUGMENTING ENTITIES OF ZI_TableForIdentificat_S
          ENTITY TableForIdentificat
            CREATE BY \_TableForIdentifText
            FROM text_for_existing_entity
            RELATING TO entities_update BY relates_cba.
      ENDIF.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
