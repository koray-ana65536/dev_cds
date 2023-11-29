FUNCTION ZKANA_FM_IDOC_ODEV.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_KUNNR) TYPE  KUNNR
*"  EXPORTING
*"     REFERENCE(ES_CUST) TYPE  ZKANA_S_IDOC_ODEV
*"----------------------------------------------------------------------

  IF iv_kunnr IS NOT INITIAL.
    SELECT name1, ort02, stras, ort01, regio, land1
      FROM kna1
      WHERE kunnr = @iv_kunnr
      INTO TABLE @DATA(lt_kunnr).

    IF lt_kunnr IS NOT INITIAL.
      READ TABLE lt_kunnr INTO es_cust INDEX 1.
    ENDIF.

  ENDIF.

ENDFUNCTION.
