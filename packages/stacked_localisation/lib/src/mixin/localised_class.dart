import 'package:stacked_localisation/src/setup_locator.dart';
import 'package:stacked_localisation/stacked_localisation.dart';

mixin LocalisedClass {
  final _localisationService = locator<LocalisationService>();
  String? translate(String key, {required List<dynamic> replacements}) {
    var stringFromFile = _localisationService[key];
    for (int i = 0; i < replacements.length; i++) {
      stringFromFile =
          stringFromFile!.replaceAll('{$i}', replacements[i].toString());
    }

    return stringFromFile;
  }
}