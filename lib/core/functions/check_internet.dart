import 'dart:io';

checkInternetConnection() async{
  try {
    var result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
      return true;
    }
  }on SocketException catch (e) {
    return false;
  }
}