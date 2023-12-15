interface ZIF_KA_OOPODEV01
  public .


  data MV_INSTNUM type NTGEW .

  methods SUM_NUMBERS
    importing
      value(IV_SUM1) type NTGEW
      value(IV_SUM2) type NTGEW
    exporting
      value(EV_SUMRESULT) type NTGEW .
endinterface.
