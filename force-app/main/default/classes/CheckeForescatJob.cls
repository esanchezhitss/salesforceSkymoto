public with sharing class CheckeForescatJob implements Schedulable {
  public void execute(SchedulableContext sc) {
    postNotification();
  }

  public static void postNotification() {
    List<CustomNotificationType> types = [
      SELECT Id
      FROM CustomNotificationType
      WHERE DeveloperName = 'custonNotificacionAlert'
      LIMIT 1
    ];

    if (types.isEmpty()) {
      System.debug('No se encontró el tipo de notificación');
      return;
    }

    Id notificationTypeId = types[0].Id;

    Date today = Date.today();
    Date lastDayOfMonth = today.toStartOfMonth().addMonths(1).addDays(-1);

    String title;
    String body;

    if (today == lastDayOfMonth) {
      title = 'Último día del mes';
      body = 'Hoy es el último día del mes';
    } else {
      title = 'Forecast no ejecutado';
      body = 'Hoy no es el último día del mes';
    }

    sendNotification(notificationTypeId, title, body);
  }

  private static void sendNotification(
    Id notificationTypeId,
    String title,
    String body
  ) {
    Messaging.CustomNotification notification = new Messaging.CustomNotification();
    notification.setTitle(title);
    notification.setBody(body);
    notification.setNotificationTypeId(notificationTypeId);
    notification.setTargetId(UserInfo.getUserId());

    try {
      notification.send(new Set<String>{ UserInfo.getUserId() });
    } catch (Exception e) {
      System.debug('Error al enviar la notificación: ' + e.getMessage());
    }
  }
}
