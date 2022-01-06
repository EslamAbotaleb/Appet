
import 'package:appet/widgets/common.dart';

import './/helpers/preferences_manager.dart';

class Session {
  static final Session shared = Session();

  Future<void> setupDefaultSession() async {
    try {
      await PreferencesManager.setupSharedPreferences();
    } catch (e) {
      logger.e(e);
    }
  }
}
