@AbapCatalog.sqlViewName: 'ZKANA_SQL_OD2_2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Training CDS Ödev 2_2'
define view zkana_cds_odev2_2
  as select from ZKANA_CDS_ODEV2 as cds_odev2
  inner join vbrk on vbrk.vbeln = cds_odev2.vbeln
{
    cds_odev2.vbeln,
    sum(cds_odev2.conversion_netwr) as total_nprice,
    cds_odev2.kunnrAd,
    count(*) as total_billing_items,
    @Semantics.currencyCode: true
    vbrk.waerk,
    @Semantics.amount.currencyCode: 'VBRK.WAERK'
    division( cast( sum(cds_odev2.conversion_netwr) as abap.dec( 15, 2 )), cast( count(*) as abap.int4 ), 2) as avg_price,
    substring( vbrk.fkdat, 1, 4) as bill_year,
    substring( vbrk.fkdat, 5, 2) as bill_month,
    substring( vbrk.fkdat, 7, 2) as bill_day,
    substring( vbrk.inco2_l, 1, 3) as incoterm
}
group by cds_odev2.vbeln, cds_odev2.kunnrAd, vbrk.fkdat, vbrk.waerk, vbrk.inco2_l;
