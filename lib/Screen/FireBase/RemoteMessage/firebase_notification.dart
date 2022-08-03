import 'dart:convert';
import 'dart:developer';
import 'package:demo_flutter/Screen/FireBase/RemoteMessage/notification_navigation.dart';
import 'package:rxdart/subjects.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

ValueNotifier<String> notificationBody = ValueNotifier<String>('');

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('receiveNotification _firebaseMessagingBackgroundHandler data: ${message.data}');
}

class FireBaseNotification {
  static final FireBaseNotification _fireBaseNotification = FireBaseNotification.init();

  factory FireBaseNotification() => _fireBaseNotification;

  FireBaseNotification.init();

  ///===> main.dart
  /// await FireBaseNotification().setUpLocalNotification();

  ///===> HomeScreen
  /// FireBaseNotification().localNotificationRequestPermissions();
  /// FireBaseNotification().configureDidReceiveLocalNotificationSubject();
  /// FireBaseNotification().configureSelectNotificationSubject();

  ///===> SplashScreen
  /// FireBaseNotification().firebaseCloudMessagingLSetup();
  ///

  late FirebaseMessaging firebaseMessaging;
  late AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    // 'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  final _selectNotificationSubject = PublishSubject<String?>();

  Stream<String?> get selectNotificationStream => _selectNotificationSubject.stream;

  final _didReceiveLocalNotificationSubject = PublishSubject<ReceivedNotification>();

  Stream<ReceivedNotification> get didReceiveLocalNotificationStream => _didReceiveLocalNotificationSubject.stream;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static bool isNotification = false;

  void firebaseCloudMessagingLSetup() async {
    firebaseMessaging = FirebaseMessaging.instance;
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    iOSPermission(firebaseMessaging);

    await firebaseMessaging.getToken().then((token) {
      /// required to save in utils
      // Constants.firebaseToken = token!;
      log('FCM TOKEN to be Registered: $token');
      debugPrint('FCM TOKEN to be Registered: $token');
    });

    // Fired when app is coming from a terminated state
    // var initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    // if (initialMessage != null) _showLocalNotification(initialMessage);

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    // If the message also contains a data property with a “type” of “chat”,
    // navigate to a chat screen
    if (initialMessage != null) {
      NavigationUtils.notificationNavigationName = initialMessage.data['redirect'].toString();
    }

    // Fired when app is in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('receiveNotification onAppOpen onMessage data: ${message.data}');
      showLocalNotification(message);
      notificationBody.value = message.notification?.title?.toString() ?? '';
    });

    // Fired when app is in foreground
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('receiveNotification onAppBackgroundOrClose onMessageOpenedApp data: ${message.data}');
      selectNotification(json.encode(message.data));
      debugPrint('Got a message, app is in the foreground! ${message.data.toString()}');
    });
  }

  Future<void> setUpLocalNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
        onDidReceiveLocalNotification: (
          int id,
          String? title,
          String? body,
          String? payload,
        ) async {
          _didReceiveLocalNotificationSubject.add(
            ReceivedNotification(
              id: id,
              title: title,
              body: body,
              payload: payload,
            ),
          );
        });

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) => selectNotification(payload));
    print("flutterLocalNotificationsPlugin Complete");
  }

  Future selectNotification(String? notificationPayload) async {
    if (notificationPayload != null && notificationPayload.isNotEmpty) {
      debugPrint('receiveNotification getInitialMessage 00');
      _selectNotificationSubject.add(notificationPayload);
    }
  }

  void iOSPermission(firebaseMessaging) {
    firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  void showLocalNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            //largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_largeIcon'),
            icon: '@mipmap/launcher_icon',
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(0, notification!.title, notification.body, platformChannelSpecifics,
        payload: json.encode(message.data));
  }

  void localNotificationRequestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  void configureDidReceiveLocalNotificationSubject() {
    print('configureDidReceiveLocalNotificationSubject stream listen');
    didReceiveLocalNotificationStream.listen((ReceivedNotification receivedNotification) async {
      print("payloadNotification 01: $receivedNotification");
      // notificationToNavigate();
    });
  }

  void configureSelectNotificationSubject() {
    selectNotificationStream.listen((String? payload) {
      print('receiveNotification configureSelectNotificationSubject 00');
      Map data = payload != null ? json.decode(payload) : {};
      NavigationUtils.navigationSwitch(data);
    });
  }

  void localNotificationDispose() {
    _didReceiveLocalNotificationSubject.close();
    _selectNotificationSubject.close();
  }
}

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}
