public with sharing class EjecutarPlattformEvent {
  public static void EjecutarrPlattformEvent() {
    System.debug('Ejecutando el evento de prueba en Salesforce');
    ticketsplatform__e ptfEvent = new ticketsplatform__e(
      ticket_id__c = 'Evento de prueba',
      TipoIncidenciaplat__c = 'Este es un evento de prueba para ejecutar una acción en Salesforce'
    );
    list<ticketsplatform__e> ptfEventTickes = new List<ticketsplatform__e>();
    ptfEventTickes.add(ptfEvent);
    System.debug('Publicado el evento de prueba en Salesforce');

    Database.SaveResult[] results = EventBus.publish(ptfEventTickes);
    for (Database.SaveResult result : results) {
      if (result.isSuccess()) {
        System.debug(
          'Evento publicado con éxito. ID del evento: ' + result.getId()
        );
      } else {
        System.debug(
          'Error al publicar el evento: ' + result.getErrors()[0].getMessage()
        );
      }
    }
  }
}
