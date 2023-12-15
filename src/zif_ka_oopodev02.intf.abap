interface ZIF_KA_OOPODEV02
  public .


  class-data MV_STATNUM type NTGEW .

  class-methods SUBSTRACT_NUMBERS
    importing
      value(IV_SUBT1) type NTGEW
      value(IV_SUBT2) type NTGEW
    returning
      value(RV_SUBT_RESULT) type NTGEW .
endinterface.
