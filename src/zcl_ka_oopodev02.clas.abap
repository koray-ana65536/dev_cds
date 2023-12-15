class ZCL_KA_OOPODEV02 definition
  public
  inheriting from ZCL_KA_OOPODEV01
  final
  create public .

public section.

  methods CALL_METHODS
    importing
      value(IV_CALL1) type NTGEW
      value(IV_CALL2) type NTGEW
      value(IV_CALL3) type NTGEW
      value(IV_CALL4) type NTGEW
    exporting
      value(CV_CALLRES1) type NTGEW
      value(CV_CALLRES2) type NTGEW .
protected section.

  methods DIVIDE_NUMBERS
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_KA_OOPODEV02 IMPLEMENTATION.


  METHOD call_methods.
    DATA(lo_oop01) = NEW zcl_ka_oopodev01( ).

    TRY.
      divide_numbers(
      EXPORTING
        iv_div1      = iv_call1                 " Net Weight
        iv_div2      = iv_call2                 " Net Weight
      CHANGING
        cv_divresult =  cv_callres1                " Net Weight
    ).
    CATCH cx_sy_zerodivide INTO DATA(lx_zerodivide).

    ENDTRY.

    TRY.
      lo_oop01->divide_numbers(
        EXPORTING
          iv_div1      = iv_call3                  " Net Weight
          iv_div2      = iv_call4                 " Net Weight
        CHANGING
          cv_divresult = cv_callres2                 " Net Weight
      ).
    CATCH cx_sy_zerodivide INTO DATA(lx_zerodivide2).

    ENDTRY.

  ENDMETHOD.


  METHOD divide_numbers.
    TRY.
        cv_divresult = iv_div1 / iv_div2.
      CATCH cx_sy_zerodivide INTO DATA(lx_zerodivide).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
