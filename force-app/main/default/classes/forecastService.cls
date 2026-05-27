public with sharing class forecastService {
  // Nota: cacheable=true cachea el resultado en LWC. Si se necesitan datos siempre frescos,
  // cambiar a cacheable=false y llamar el método de forma imperativa en el LWC.
  @AuraEnabled(cacheable=true)
  public static Map<String, List<String>> obtenerRazas() {
    try {
      HttpRequest req = new HttpRequest();
      req.setEndpoint('callout:pruebaSercicio/api/breeds/list/all');
      req.setMethod('GET');

      Http http = new Http();
      HttpResponse res = http.send(req);

      if (res.getStatusCode() != 200) {
        throw new AuraHandledException(
          'Error al obtener razas. Status: ' + res.getStatusCode()
        );
      }

      DogResponse data = (DogResponse) JSON.deserialize(
        res.getBody(),
        DogResponse.class
      );

      if (data == null || data.message == null) {
        throw new AuraHandledException(
          'La respuesta de la API no contiene datos de razas.'
        );
      }

      return data.message;
    } catch (AuraHandledException e) {
      throw e;
    } catch (Exception e) {
      throw new AuraHandledException('Error inesperado: ' + e.getMessage());
    }
  }

  public class DogResponse {
    public Map<String, List<String>> message;
    public String status;
  }
}
