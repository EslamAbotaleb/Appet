import 'package:appet/providers/lang/app_language.dart';
import 'package:appet/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'helpers/app_localizations.dart';
import 'helpers/session.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Session.shared.setupDefaultSession();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(MyApp(appLanguage));
}

class MyApp extends StatefulWidget {
  final AppLanguage appLanguage;

  MyApp(this.appLanguage);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
      create: (_) => widget.appLanguage,
      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return MaterialApp(
          supportedLocales: [
            Locale('en', 'US'),
            Locale('ar', ''),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: model.appLocal,
          debugShowCheckedModeBanner: false,
          title: '',
          builder: (context, child) => Scaffold(
            resizeToAvoidBottomInset: false,
            body: child,
          ),
          home: SplashScreen(),
        );
      }),
    );
  }
}
