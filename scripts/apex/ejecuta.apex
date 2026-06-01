//System.debug(ticketService.getallTickets());//probar metodo getallTickets() del servicio de tickets 


Integer contadorticket=[select count() from Tickets__c]; //contar el numero de tickets en la base de datos
System.debug('Numero de tickets en la base de datos: ' + contadorticket);

list<Tickets__c> listadetickets=[select Id, Name from Tickets__c]; //obtener una lista de todos los tickets con su Id, Nombre y Estado
for(Tickets__c ticket : listadetickets){ //recorrer la lista de tickets
    System.debug('Id del ticket: ' + ticket.Id + ' Nombre del ticket: ' + ticket.Name ); //imprimir el Id, Nombre y Estado de cada ticket
}   


Tickets__c ticket1 = new Tickets__c(Name='INC-0004', Tipo_Incidencia__c='CAIDA DE INTERNET', Telefono__c='1245689'); //crear un nuevo ticket con el nombre "Ticket de prueba" y estado "Abierto"
insert ticket1; //insertar el nuevo ticket en la base de datos
System.debug('Nuevo ticket creado con Id: ' + ticket1.Id); //imprimir el Id del nuevo ticket creado

Savepoint sp = Savepoint(); //crear un punto de guardado para poder deshacer los cambios si es necesario
try{

    ticket1.Name = 'INC-0005'; //modificar el nombre del ticket creado
    update ticket1; //actualizar el ticket en la base de datos
    System.debug('Ticket actualizado con nuevo nombre: ' + ticket1.Name); //imprimir el nuevo nombre del ticket actualizado
}   catch(Exception e){
    Database.rollback(sp); //si ocurre un error, deshacer los cambios realizados
    System.debug('Error al actualizar el ticket: ' + e.getMessage()); //imprimir el mensaje de error
}