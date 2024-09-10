import 'package:flutter/material.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:lottie/lottie.dart';
import 'package:my_store/core/constants/app_image_assets.dart';

class HandlingDataView extends StatelessWidget {
  final RequestStatus requestStatus;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.requestStatus, required this.widget});

  @override
  Widget build(BuildContext context) {
    return requestStatus == RequestStatus.loading
        ? Center(child: Lottie.asset(AppImageAssets.loadingLottie,width: 200,height: 200))
        : requestStatus == RequestStatus.offlineFailure
            ? Center(child: Lottie.asset(AppImageAssets.offlineLottie))
            : requestStatus == RequestStatus.serverFailure
                ? Center(child: Lottie.asset(AppImageAssets.pageNotFoundLottie))
                : requestStatus == RequestStatus.failure
                    ? Center(child: Lottie.asset(AppImageAssets.noDataLottie))
                    : widget;
  }
}
