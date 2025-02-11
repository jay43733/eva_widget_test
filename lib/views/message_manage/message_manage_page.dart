import 'package:flutter/material.dart';

class MessageManagementPage extends StatefulWidget {
  const MessageManagementPage({super.key});

  @override
  State<MessageManagementPage> createState() => _MessageManagementState();
}

class _MessageManagementState extends State<MessageManagementPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [Text("Message Management Page")],
      ),
    );
  }
}
