import 'package:demo_flutter/Screen/FireBase/RemoteMessage/firebase_notification.dart';
import 'package:demo_flutter/Screen/SharePreference/shared_preferences.dart';
import 'package:demo_flutter/flutter_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyDz5GrQTHWiY_RudrwD8v7lqHgTyLP458U',
      appId: '1:945117182376:android:440264540f90d3bd38859d',
      messagingSenderId: '945117182376',
      projectId: 'flip-clock-fecc8',
    ),
  );
  await FireBaseNotification().setUpLocalNotification();
  await SharedPrefs.initMySharedPreferences();
  runApp(MyApp());
}
// Upload project to git
// - create repo in Github
// - open terminal and follow below command
// - git init
// - git remote add origin "enter git repo link"
// - git add .
// - git commit -m "commit message"
// - git push
//
// Remove git from project
// - project files > remove git folder
// - Android studio setting(preference) > version control  > remove from Directory Mappings
