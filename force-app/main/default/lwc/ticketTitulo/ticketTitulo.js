import { LightningElement } from 'lwc';

export default class TicketTitulo extends LightningElement {


ticket = {
    title: 'Titulo del ticket',
    description: 'Descripción del ticket',
    imageUrl: 'https://www.svgrepo.com/show/331488/ticket.svg',
    status: 'Abierto',
    fechaCreacion: '2024-06-01' };
  
}
