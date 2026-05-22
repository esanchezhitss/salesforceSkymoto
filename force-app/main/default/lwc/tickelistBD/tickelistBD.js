import { LightningElement, wire } from "lwc";
// import getallTickets from '@salesforce/apex/ticketService.getallTickets';
import getTicketsBySearch from "@salesforce/apex/ticketService.getTicketsByDescription";
export default class TickelistBD extends LightningElement {
  // @wire(getallTickets)
  // ticketsbd;

  searchTerm = "";
  @wire(getTicketsBySearch, { searchTerm: "$searchTerm" })
  ticketsbd;

  handleSearchChange(event) {
    const busquedaText = event.target.value;

    if (busquedaText.length >= 3 || busquedaText === "") {
      this.searchTerm = busquedaText;

      console.log("Busqueda:", busquedaText);
    }
  }
}
