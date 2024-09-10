import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:http/http.dart' as http;
import 'package:my_store/core/functions/check_internet.dart';

class Crud {
  Future<Either<RequestStatus, Map>> postData(String urlLink, Map data) async {
    if (await checkInternetConnection()) {
      try {
        var response = await http.post(Uri.parse(urlLink), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(RequestStatus.serverFailure);
        }
      } on SocketException catch (_) {
        return const Left(RequestStatus.serverFailure);
      }
    } else {
      return const Left(RequestStatus.offlineFailure);
    }
  }       
}
