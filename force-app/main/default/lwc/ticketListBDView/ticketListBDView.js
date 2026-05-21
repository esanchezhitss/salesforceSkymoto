import { LightningElement,api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
export default class TicketListBDView extends NavigationMixin(LightningElement) {

    @api ticketbdview; 


    handleViewDetails() {   
        // Navigate to the record page
    this[NavigationMixin.Navigate]({
        type: 'standard__recordPage',
        attributes: {
            recordId: this.ticketbdview.Id, // Use the actual record ID from the ticketbdview object
            objectApiName: 'Tickets__c',
            actionName: 'view'
        }
    });
    }   
}