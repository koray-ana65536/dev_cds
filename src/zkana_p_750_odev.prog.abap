*&---------------------------------------------------------------------*
*& Report ZKANA_P_750_ODEV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zkana_p_750_odev.

TYPES: BEGIN OF ty_werks,
         werks  TYPE werks_d,
         arbpl  TYPE arbpl,
         toplam TYPE menge_d,
         meins  TYPE meins,
         islem  TYPE int8,
       END OF ty_werks.

TYPES: gty_werks TYPE STANDARD TABLE OF ty_werks WITH EMPTY KEY.

DATA(lt_werks) = VALUE gty_werks( ( werks = '1000' arbpl = '01' toplam = '44' )
                                  ( werks = '1000' arbpl = '02' toplam = '123' )
                                  ( werks = '1000' arbpl = '02' toplam = '56' )
                                  ( werks = '1010' arbpl = '01' toplam = '91' )
                                  ( werks = '1010' arbpl = '01' toplam = '12' )
                                  ( werks = '1010' arbpl = '02' toplam = '14' )
                                  ( werks = '1010' arbpl = '02' toplam = '25' )
                                  ( werks = '1010' arbpl = '02' toplam = '32' )
                                  ( werks = '1010' arbpl = '03' toplam = '55' )
                                  ( werks = '1020' arbpl = '01' toplam = '1907' )
                                  ( werks = '1020' arbpl = '01' toplam = '750' )
                                  ( werks = '1020' arbpl = '02' toplam = '880' )
                                  ( werks = '1020' arbpl = '02' toplam = '75' ) ).

DATA(lt_werks2) = VALUE gty_werks( FOR GROUPS grp1 OF ls_werks IN lt_werks GROUP BY ( werks = ls_werks-werks
                                                                                      arbpl = ls_werks-arbpl ) ASCENDING

                                   LET lv_meins = 'ADT'
                                   lv_carp1 = 5
                                   lv_carp2 = 3 IN meins = lv_meins
                                                   islem = lv_carp1 * lv_carp2

                                   ( werks = grp1-werks
                                     arbpl = grp1-arbpl
                                     toplam = REDUCE menge_d( INIT val TYPE menge_d
                                                              FOR ls IN GROUP grp1
                                                              NEXT val = val + ls-toplam ) ) ).
