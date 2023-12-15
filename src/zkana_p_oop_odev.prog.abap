*&---------------------------------------------------------------------*
*& Report ZKANA_P_OOP_ODEV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZKANA_P_OOP_ODEV.

PARAMETERS: p_dec1 TYPE ntgew,
            p_dec2 TYPE ntgew,
            p_dec3 TYPE ntgew,
            p_dec4 TYPE ntgew.

DATA: lv_dec1 TYPE ntgew,
      lv_dec2 TYPE ntgew,
      lv_dec3 TYPE ntgew,
      lv_dec4 TYPE ntgew,
      lv_dec5 TYPE ntgew,
      lv_dec6 TYPE ntgew.

DATA(lo_oop1) = NEW zcl_ka_oopodev01( ).
DATA(lo_oop1_2) = NEW zcl_ka_oopodev01( ).
DATA(lo_oop2) = NEW zcl_ka_oopodev02( ).

lo_oop1->zif_ka_oopodev01~sum_numbers(
  EXPORTING
    iv_sum1      = p_dec1                 " Net Weight
    iv_sum2      = p_dec2                 " Net Weight
  IMPORTING
    ev_sumresult = lv_dec1                 " Net Weight
).

lv_dec2 = lo_oop1->zif_ka_oopodev02~substract_numbers(
            iv_subt1 = p_dec1                  " Net Weight
            iv_subt2 = p_dec2                 " Net Weight
          ).

lo_oop1_2->zif_ka_oopodev01~sum_numbers(
  EXPORTING
    iv_sum1      = p_dec3                 " Net Weight
    iv_sum2      = p_dec4                 " Net Weight
  IMPORTING
    ev_sumresult = lv_dec3                 " Net Weight
).

lv_dec4 = lo_oop1_2->zif_ka_oopodev02~substract_numbers(
            iv_subt1 = p_dec3                  " Net Weight
            iv_subt2 = p_dec4                  " Net Weight
          ).


lo_oop2->call_methods(
  EXPORTING
    iv_call1    = p_dec1                 " Net Weight
    iv_call2    = p_dec2                 " Net Weight
    iv_call3    = p_dec3                 " Net Weight
    iv_call4    = p_dec4                 " Net Weight
  IMPORTING
    cv_callres1 = lv_dec5                 " Net Weight
    cv_callres2 = lv_dec6                 " Net Weight
).

WRITE: '1. Toplama : ', lv_dec1.
WRITE:/ '1. Çıkarma : ', lv_dec2.
WRITE:/ '2. Toplama : ', lv_dec3.
WRITE:/ '2. Çıkarma : ', lv_dec4.
WRITE:/ '1. Bölme : ', lv_dec5.
WRITE:/ '2. Bölme : ', lv_dec6.
WRITE:/ 'Instance değişken 1: ', lo_oop1->zif_ka_oopodev01~mv_instnum.
WRITE:/ 'Static değişken 1: ', lo_oop1->zif_ka_oopodev02~mv_statnum.
WRITE:/ 'Instance değişken 2: ', lo_oop1_2->zif_ka_oopodev01~mv_instnum.
WRITE:/ 'Static değişken 2: ', lo_oop1_2->zif_ka_oopodev02~mv_statnum.
