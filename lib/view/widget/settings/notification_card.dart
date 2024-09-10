import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final void Function(bool)? onSwitchChanged;
  const NotificationCard({super.key,required this.onSwitchChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
          child: ListTile(
            title: const Text("Notifications"),
            leading: Icon(
              Icons.notifications_none,
              size: 25,
              color: Colors.orange[300],
            ),
            trailing: Switch(
              dragStartBehavior: DragStartBehavior.down,
              activeColor: Colors.blue,
              value: true,
              onChanged: onSwitchChanged,
            ),
          ),
        );
  }
}
