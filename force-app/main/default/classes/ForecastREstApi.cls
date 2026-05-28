@RestResource(urlMapping='/chekForecast')
global with sharing class ForecastREstApi {
  @HttpGet
  static global String doGet() {
    // Lógica para obtener los datos de forecast4
    //para leer paramaetros de la URL, puedes usar RestContext.request.params.get('paramName')
    // String paramValue = RestContext.request.params.get('paramName');
    //RestResponse res = RestContext.response;
    return 'Datos de forecast obtenidos correctamente';
  }
}
