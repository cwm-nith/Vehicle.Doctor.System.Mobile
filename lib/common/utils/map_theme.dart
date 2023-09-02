import 'package:flutter/services.dart';

enum MapThemeType {
  standard,
  aubergine,
  dark,
  night,
  retro,
  silver,
}

class MapTheme {
  static Future<String> getTheme(MapThemeType type) async {
    var rt = "[]";
    switch (type) {
      case MapThemeType.aubergine:
        rt = await _loadMapStyles("aubergine");
        break;
      case MapThemeType.dark:
        rt = await _loadMapStyles("dark");
        break;
      case MapThemeType.night:
        rt = await _loadMapStyles("night");
        break;
      case MapThemeType.retro:
        rt = await _loadMapStyles("retro");
        break;
      case MapThemeType.silver:
        rt = await _loadMapStyles("silver");
        break;
      case MapThemeType.standard:
        break;
      default:
        break;
    }

    return rt;
  }

  static Future<String> _loadMapStyles(String name) async {
    return await rootBundle.loadString('assets/map_themes/$name.json');
  }
}
