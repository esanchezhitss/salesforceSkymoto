import { LightningElement } from 'lwc';
export default class TicketList extends LightningElement {

   
  
   ticketsnuevos = [
    {id: 1,
    descripcion_incidencia__c: 'Ejemplo de incidencia',
    Image_URL__c: 'https://via.placeholder.com/150', 
    Tipo_Incidencia__c: 'Tipo de ejemplo'
    },
    {id: 2, 
    descripcion_incidencia__c: 'Otra incidencia', 
    Image_URL__c: 'https://via.placeholder.com/150/0000FF/808080', 
    Tipo_Incidencia__c: 'Tipo diferente'
     },
     
     {
    id: 3,
    descripcion_incidencia__c: 'Tercera incidencia',
    Image_URL__c: 'https://via.placeholder.com/150/FF0000/FFFFFF',
    Tipo_Incidencia__c: 'Tipo adicional'
    }
];
}