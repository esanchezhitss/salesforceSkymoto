@isTest
public with sharing class ticketsPruebaTest {
  @testSetup
  static void setupTestData() {
    Tickets__c ticket = new Tickets__c(
      descripcion_incidencia__c = 'ABDC Test ticket',
      Telefono__c = 600000000
    );
    insert ticket;
  }

  @isTest
  static void getallTickets() {
    // WHEN
    List<Tickets__c> tickets = ticketService.getallTickets();
    // THEN
    System.assertNotEquals(
      null,
      tickets,
      'La lista de tickets no debe ser nula'
    );
    System.assertEquals(1, tickets.size(), 'Debe haber 1 ticket en la lista');
  }

  @isTest
  static void getTicketsByDescription() {
    // GIVEN
    String searchTerm = 'ABDC';
    // WHEN
    List<Tickets__c> tickets = ticketService.getTicketsByDescription(
      searchTerm
    );
    // THEN
    System.assertNotEquals(
      null,
      tickets,
      'La lista de tickets no debe ser nula'
    );
    System.assertEquals(
      1,
      tickets.size(),
      'Debe encontrar 1 ticket con esa descripcion'
    );
  }

  @isTest
  static void getTicketsByDescriptionSinCoincidencias() {
    // GIVEN: termino que no existe
    String searchTerm = 'ZZZNOMATCH';
    // WHEN
    List<Tickets__c> tickets = ticketService.getTicketsByDescription(
      searchTerm
    );
    // THEN
    System.assertNotEquals(
      null,
      tickets,
      'La lista no debe ser nula aunque no haya coincidencias'
    );
    System.assertEquals(
      0,
      tickets.size(),
      'No debe haber tickets con esa descripcion'
    );
  }

  @isTest
  static void getTicketsByDescriptionVacia() {
    // GIVEN: busqueda vacia debe devolver todos los tickets
    String searchTerm = '';
    // WHEN
    List<Tickets__c> tickets = ticketService.getTicketsByDescription(
      searchTerm
    );
    // THEN
    System.assertNotEquals(
      null,
      tickets,
      'La lista de tickets no debe ser nula'
    );
    System.assertEquals(
      1,
      tickets.size(),
      'Debe devolver todos los tickets cuando la busqueda esta vacia'
    );
  }
}
