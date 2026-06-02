//System.debug(ticketService.getallTickets());//probar metodo getallTickets() del servicio de tickets 


Integer contadorticket=[select count() from Tickets__c]; //contar el numero de tickets en la base de datos
System.debug('Numero de tickets en la base de datos: ' + contadorticket);

list<Tickets__c> listadetickets=[select Id, Name from Tickets__c]; //obtener una lista de todos los tickets con su Id, Nombre y Estado
for(Tickets__c ticket : listadetickets){ //recorrer la lista de tickets
    System.debug('Id del ticket: ' + ticket.Id + ' Nombre del ticket: ' + ticket.Name ); //imprimir el Id, Nombre y Estado de cada ticket
}   


Tickets__c ticket1 = new Tickets__c(Name='INC-0004',Telefono__c=123456789); //crear un nuevo ticket con el nombre "Ticket de prueba" y estado "Abierto"

Savepoint sp = Database.setSavepoint(); //crear un punto de guardado para poder deshacer los cambios si es necesario
try{
insert ticket1; //insertar el nuevo ticket en la base de datos
System.debug('Nuevo ticket creado con Id: ' + ticket1.Id); //imprimir el Id del nuevo ticket creado

    
    System.debug('Ticket actualizado con nuevo nombre: ' + ticket1.Name); //imprimir el nuevo nombre del ticket actualizado
}   catch(Exception e){
    Database.rollback(sp); //si ocurre un error, deshacer los cambios realizados
    System.debug('Error al actualizar el ticket: ' + e.getMessage()); //imprimir el mensaje de error
}