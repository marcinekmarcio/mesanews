import 'package:connectivity/connectivity.dart';
import 'package:mesa_news_projeto/exp_arq.dart';

void salveTokenApp(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('mesaNewsToken', token);
}

void salveFavorite(String fav) async {
  String getFav = "";
  String newFav = "";
  SharedPreferences prefs = await SharedPreferences.getInstance();
  getFav = prefs.getString('mesaNewsFav');
  newFav = (getFav == null ? "" : getFav) + fav + ",";
  prefs.setString('mesaNewsFav', newFav);
}

void removeFavorite(String fav) async {
  String getFav = "";
  String newFav = "";
  SharedPreferences prefs = await SharedPreferences.getInstance();
  getFav = prefs.getString('mesaNewsFav');
  newFav = (getFav == null ? "" : getFav).replaceAll(fav + ',', '');
  prefs.setString('mesaNewsFav', newFav);
}

Future<bool> getFavorite(String fav) async {
  bool getFav = false;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String mesaNewsFav = prefs.getString('mesaNewsFav');

  if (mesaNewsFav != null)
    getFav = mesaNewsFav.split(',').toList().where((e) => e == fav).isNotEmpty;
  return getFav;
}

Future<bool> check() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}
