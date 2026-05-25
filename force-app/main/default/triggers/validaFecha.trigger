trigger validaFecha on detalleTicket__c(before insert, before update) {
  //Trigger.isInsert: se ejecuta antes de insertar un nuevo registro
  //Trigger.isUpdate: se ejecuta antes de actualizar un registro existente
  //hay que hacer antes la bifurcacion para evitar errores de validación en ambos casos
  if (Trigger.isInsert) {
    for (detalleTicket__c det : Trigger.new) {
      if (det.fechainicial__c < Date.today()) {
        det.addError('La fecha inicial no puede ser menor a la fecha actual');
      } else {
        det.fechainicial__c = Date.today();
      }
    }
  }
  if (Trigger.isUpdate) {
    for (detalleTicket__c det : Trigger.new) {
      if (det.fechainicial__c < Date.today()) {
        det.addError('La fecha inicial no puede ser menor a la fecha actual');
      } else if (det.fechaFinal__c < det.fechainicial__c) {
        det.addError('La fecha final no puede ser menor a la fecha inicial');
      } else {
        det.fechaFinal__c = det.fechaFinal__c;
        det.txtNumeroDias__c = String.valueOf(
          Integer.valueOf(det.fechainicial__c.daysBetween(det.fechaFinal__c))
        );
      }
    }
  }
}
