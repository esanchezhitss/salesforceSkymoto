import  {LightningElement, wire } from 'lwc';
import getallTickets from '@salesforce/apex/ticketService.getallTickets';
// import getTicketsBySearch from '@salesforce/apex/ticketService.getTicketsBySearch';
export default class TickelistBD extends LightningElement {
  @wire(getallTickets)
  ticketsbd;

  // searchTerm ;
  // @wire(getTicketsBySearch, { searchTerm: '$searchTerm' })
  //searchResults;

 
  // handleSearchChange(event) {
  //   const searchTerm = event.target.value.toLowerCase();
  //   this.ticketsbd.data = this.ticketsbd.data.filter(ticket =>
    
  //     ticket.descripcion_incidencia__c.toLowerCase().includes(searchTerm)
  //   );
  // }
} 