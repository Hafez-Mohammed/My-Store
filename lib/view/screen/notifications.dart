import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:my_store/controller/notification_controller.dart';
import 'package:my_store/core/classes/handling_data_view.dart';
import 'package:my_store/core/constants/app_colors.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: GetBuilder<NotificationController>(
        builder: (controller) => HandlingDataView(
            requestStatus: controller.requestStatus,
            widget: Padding(
              padding: const EdgeInsets.all(10).r,
              child: ListView.builder(
                itemCount: controller.notifications.length,
                itemBuilder: (context, index) => ListTile(
                  isThreeLine: true,
                  leading: Icon(
                    Icons.notifications_rounded,
                    color: AppColors.settingsIconColor,
                    size: 30.r,
                  ),
                  title: Text(
                    controller.notifications[index].title!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    controller.notifications[index].body!,
                    style: TextStyle(
                        fontSize: 14.sp, fontWeight: FontWeight.normal),
                  ),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(Jiffy.parse(controller.notifications[index].date!)
                          .fromNow()),
                      Expanded(
                        child: IconButton(
                            onPressed: () {
                              controller.deleteNotification(
                                  controller.notifications[index].id!);
                            },
                            color: Colors.red,
                            iconSize: 25.r,
                            icon: const Icon(Icons.delete_outline_outlined)),
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
