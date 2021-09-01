
import 'package:shared_preferences/shared_preferences.dart';

Future<List<String>> getUserData() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  int id = preferences.getInt("id");
  String jwt = preferences.getString("token");
  String name = preferences.getString("name");
  String image = preferences.getString("image");
  return [id.toString(),jwt,name,image];
}
Future<String> getcatId() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String catId = preferences.getString("cat_id");
  return catId;
}