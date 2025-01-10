CLASS zcl_03_abap_cds_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_abap_cds_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  SELECT from /DMO/C_Booking_Approver_M
  FIELDS *
  where CarrierID = 'LH' and ConnectionID = '0400'
  into table @data(flights).

  out->write(  flights ).


  ENDMETHOD.
ENDCLASS.
