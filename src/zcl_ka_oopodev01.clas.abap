class ZCL_KA_OOPODEV01 definition
  public
  create public .

public section.

  interfaces ZIF_KA_OOPODEV01 .
  interfaces ZIF_KA_OOPODEV02 .
protected section.

  methods DIVIDE_NUMBERS
    importing
      value(IV_DIV1) type NTGEW
      value(IV_DIV2) type NTGEW
    changing
      value(CV_DIVRESULT) type NTGEW
    raising
      CX_SY_ZERODIVIDE .
private section.
ENDCLASS.



CLASS ZCL_KA_OOPODEV01 IMPLEMENTATION.


  METHOD divide_numbers.
    TRY.
      cv_divresult = iv_div1 / iv_div2.
    CATCH cx_sy_zerodivide INTO DATA(lx_zerodivide).

    ENDTRY.
  ENDMETHOD.


  METHOD zif_ka_oopodev01~sum_numbers.
    ev_sumresult = iv_sum1 + iv_sum2.
    zif_ka_oopodev01~mv_instnum = ev_sumresult.
  ENDMETHOD.


  METHOD zif_ka_oopodev02~substract_numbers.
    rv_subt_result = iv_subt1 - iv_subt2.
    zif_ka_oopodev02~mv_statnum = rv_subt_result.
  ENDMETHOD.
ENDCLASS.
