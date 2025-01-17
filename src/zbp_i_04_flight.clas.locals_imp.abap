CLASS lhc_flight DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Flight RESULT result.



ENDCLASS.

CLASS lhc_booking DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Booking RESULT result.

    METHODS CancelBooking FOR MODIFY
      IMPORTING keys FOR ACTION Booking~CancelBooking RESULT result.

ENDCLASS.

CLASS lhc_flight IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.
ENDCLASS.


CLASS lhc_booking IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD CancelBooking.

    READ ENTITY IN LOCAL MODE zi_04_booking
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(bookings).

    LOOP AT bookings REFERENCE INTO DATA(booking).
      booking->BookingStatus = 'X'.
    ENDLOOP.

    MODIFY ENTITY IN LOCAL MODE zi_04_booking
              UPDATE FIELDS ( BookingStatus )
              WITH VALUE #( FOR t IN bookings
              (  %tky = t-%tky BookingStatus = t-BookingStatus ) ).

  ENDMETHOD.

ENDCLASS.
