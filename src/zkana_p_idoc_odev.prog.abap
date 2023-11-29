*&---------------------------------------------------------------------*
*& Report ZKANA_P_IDOC_ODEV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zkana_p_idoc_odev.

DATA: ls_cust  TYPE zkana_s_idoc_odev,
      ls_edidc TYPE edidc,
      ls_sdata TYPE edi_sdata,
      lt_edidd TYPE TABLE OF edidd,
      lt_edidc TYPE TABLE OF edidc.

PARAMETERS: p_kunnr TYPE kunnr.


CALL FUNCTION 'ZKANA_FM_IDOC_ODEV'
  EXPORTING
    iv_kunnr = p_kunnr
  IMPORTING
    es_cust  = ls_cust.

IF ls_cust IS NOT INITIAL.

  ls_sdata = |{ ls_cust-name1 ALPHA = IN }{ ls_cust-ort02 ALPHA = IN }{ ls_cust-stras ALPHA = IN }{ ls_cust-ort01 ALPHA = IN }{ ls_cust-regio ALPHA = IN }{ ls_cust-land1 ALPHA = IN }|.

  ls_edidc = VALUE edidc( mestyp = 'ZKANA_IDOC01'
                          doctyp = 'ZKANA_IDOC01'
                          rcvprn = 'S4HCLNT500'
                          rcvprt = 'LS' ).

  APPEND VALUE edidd( segnam = 'ZKANA_IDOC01'
                      sdata = ls_sdata ) TO lt_edidd.

  CALL FUNCTION 'MASTER_IDOC_DISTRIBUTE'
    EXPORTING
      master_idoc_control            = ls_edidc
    TABLES
      communication_idoc_control     = lt_edidc
      master_idoc_data               = lt_edidd
    EXCEPTIONS
      error_in_idoc_control          = 1
      error_writing_idoc_status      = 2
      error_in_idoc_data             = 3
      sending_logical_system_unknown = 4
      OTHERS                         = 5.

  IF sy-subrc = 0.
    CALL FUNCTION 'DB_COMMIT'.
    CALL FUNCTION 'DEQUEUE_ALL'.
    COMMIT WORK.

    MESSAGE 'Kayıtlar başarıyla gönderildi.' TYPE 'I' DISPLAY LIKE 'S'.
  ELSE.
    MESSAGE 'Kayıtlar gönderilemedi.' TYPE 'I' DISPLAY LIKE 'E'.
  ENDIF.

ENDIF.
