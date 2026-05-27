@isTest
public with sharing class forecastServicetest {
  // Mock HTTP que simula la respuesta de la API de razas
  private class DogApiMock implements HttpCalloutMock {
    public HTTPResponse respond(HTTPRequest req) {
      HttpResponse res = new HttpResponse();
      res.setStatusCode(200);
      res.setBody(
        '{"message":{"labrador":[],"poodle":["toy","miniature"]},"status":"success"}'
      );
      res.setHeader('Content-Type', 'application/json');
      return res;
    }
  }

  @isTest
  static void obtenerRazas_devuelveMapaConRazas() {
    // GIVEN
    Test.setMock(HttpCalloutMock.class, new DogApiMock());

    // WHEN
    Test.startTest();
    Map<String, List<String>> razas = forecastService.obtenerRazas();
    Test.stopTest();

    // THEN
    System.assertNotEquals(null, razas, 'El mapa de razas no debe ser nulo');
    System.assertEquals(2, razas.size(), 'Debe haber 2 razas en el resultado');
    System.assert(
      razas.containsKey('labrador'),
      'Debe contener la raza labrador'
    );
    System.assert(razas.containsKey('poodle'), 'Debe contener la raza poodle');
    System.assertEquals(
      2,
      razas.get('poodle').size(),
      'Poodle debe tener 2 subrazas'
    );
  }

  @isTest
  static void obtenerRazas_razaSinSubrazas() {
    // GIVEN
    Test.setMock(HttpCalloutMock.class, new DogApiMock());

    // WHEN
    Test.startTest();
    Map<String, List<String>> razas = forecastService.obtenerRazas();
    Test.stopTest();

    // THEN
    System.assertEquals(
      0,
      razas.get('labrador').size(),
      'Labrador no debe tener subrazas'
    );
  }
}
