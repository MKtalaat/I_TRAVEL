import 'package:url_launcher/url_launcher_string.dart';


Future<void> openMap({required String location}) async {
  String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$location';
    await launchUrlString(googleUrl);
  }
