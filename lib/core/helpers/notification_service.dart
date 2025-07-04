import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medicare/features/add_med/data/model/add_med_request_model.dart';
import 'package:medicare/generated/l10n.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  initializeNotification() async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));
    final AndroidFlutterLocalNotificationsPlugin? permissions =
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    if (permissions != null) {
      await permissions.requestNotificationsPermission();
      await permissions.requestExactAlarmsPermission();
    }
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Method to show notification
  Future<void> scheduleNotification({
    required AddMedRequestModel addMedRequestModel,
    required BuildContext context,
  }) async {
    final startData = addMedRequestModel.dateTime.toDate();
    final duration = addMedRequestModel.durationDays ?? 1;
    final intervalHours = addMedRequestModel.intervalHours ?? 1;
    for (int i = 0; i < duration; i++) {
      if (addMedRequestModel.repeatType == S.of(context).OneTime) {
        if (startData.isBefore(DateTime.now())) {
          continue;
        }
        await showNotification(
          id: addMedRequestModel.id.toString().hashCode,
          scheduledTime: startData,
          addMedRequestModel: addMedRequestModel,
          context: context,
        );
      } else if (addMedRequestModel.repeatType == S.of(context).Daily) {
        final scheduledDate = startData.add(Duration(days: i));
        if (scheduledDate.isBefore(DateTime.now())) {
          continue;
        }
        await showNotification(
          id: addMedRequestModel.id.toString().hashCode + i,
          scheduledTime: scheduledDate,
          addMedRequestModel: addMedRequestModel,
          context: context,
        );
      } else if (addMedRequestModel.repeatType == S.of(context).EveryXHours) {
        final dosesPerDay = (24 / intervalHours).floor();
        for (int j = 0; j < dosesPerDay; j++) {
          final scheduledDate =
              startData.add(Duration(days: i, hours: j * intervalHours));
          if (scheduledDate.isBefore(DateTime.now())) {
            continue;
          }
          await showNotification(
              addMedRequestModel: addMedRequestModel,
              scheduledTime: scheduledDate,
              context: context,
              id: addMedRequestModel.id.hashCode + i * 100 + j);
        }
      }
    }
  }

  static const String channelId = 'med_channel';
  static const String channelName = 'Medicine Notifications';
  showNotification({
    required int id,
    required DateTime scheduledTime,
    required AddMedRequestModel addMedRequestModel,
    required BuildContext context,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channelId,
      channelName,
      importance: Importance.max,
      priority: Priority.high,
      enableVibration: true,
      playSound: true,
      autoCancel: false,
      ongoing: true,
    );
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      '${S.of(context).MedicationReminders} 💊',
      '${S.of(context).Timetotakeyourmedication} ${addMedRequestModel.name} ${S.of(context).Dose}: ${addMedRequestModel.dose}',
      tz.TZDateTime.from(scheduledTime, tz.local),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  // Method to cancel all notifications
  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  // Method to cancel specific notification
  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
