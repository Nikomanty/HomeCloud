import 'package:home_cloud/core/configs/api_keys.dart';

class HomeCloudStrings {
  static const String appName = "Home Cloud";
  static const String itemDeletionQuestion = "Poistaanko:";
  static const String confirmItemDeletion = "Poista";
  static const String deletedString = "poistettu";
  static const String confirmItemEdition = "Vahvista \nmuutokset";
  static const String confirmCreate = "Luo";
  static const String cancelString = "Peruuta";

  static String weatherUrl(String type, String long, String lat) =>
      "https://api.openweathermap.org/data/2.5/$type?lat=$lat&lon=$long&appid=$weatherApiKey&units=metric";
}
