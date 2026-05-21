public with sharing class ticketService {
     @AuraEnabled(cacheable=true)
    public static List<Tickets__c> getallTickets() {
        return [
            SELECT Id,  descripcion_incidencia__c,Image_URL__c, imagenagregada__c,Tipo_Incidencia__c,Reinicidencia__c
         FROM Tickets__c];
    }

    @AuraEnabled(cacheable=true)
    public static List<Tickets__c> getTicketsByDescription(String description) {
        string searchTerm = '%' + description + '%';//evita la inyeccion de SQL y permite buscar coincidencias parciales
        return [
            SELECT Id, descripcion_incidencia__c, Image_URL__c, imagenagregada__c, Tipo_Incidencia__c, Reinicidencia__c
            FROM Tickets__c
            WHERE descripcion_incidencia__c LIKE :searchTerm
        ];
    }
}