import 'package:my_store/core/classes/request_status.dart';

handlingData(response) {
  if (response is RequestStatus) {
    return response;
  } else if(response['status'] == "failure"){
    return RequestStatus.failure;
  }
  else{
    return RequestStatus.success;
  }
}
