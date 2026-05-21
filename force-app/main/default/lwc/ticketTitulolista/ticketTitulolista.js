import { LightningElement } from 'lwc';
import { api } from 'lwc'; 
 
export default class TicketTitulolista extends LightningElement {
    _tickets = [];

    @api
    set tickets(value) {
        this._tickets = Array.isArray(value) ? value : (value ? [value] : []);
    }

    get tickets() {
        return this._tickets;
    }
}
