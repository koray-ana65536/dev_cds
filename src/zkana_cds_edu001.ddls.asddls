@AbapCatalog.sqlViewName: 'ZKANA_SQL_EDU001'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'NDBS Training CDS PO'
@UI.presentationVariant: [{ sortOrder: [{ by: 'sas_baslik', direction: #ASC }] }]
define view ZKANA_CDS_EDU001 as select from ekko 
    inner join ekpo on ekpo.ebeln = ekko.ebeln
    inner join mara on mara.matnr = ekpo.matnr
    inner join makt on makt.matnr = mara.matnr
        and makt.spras = $session.system_language
    inner join lfa1 on lfa1.lifnr = ekko.lifnr
    
{
    key ekko.ebeln as sas_baslik,
    key ekpo.ebelp as sas_kalem,
    ekpo.matnr,
    makt.maktx,
    ekpo.werks,
    ekpo.lgort,
    ekpo.meins,
    lfa1.lifnr,
    lfa1.name1,
    concat_with_space(lfa1.stras, lfa1.mcod3, 1) as satici_adresi
}
