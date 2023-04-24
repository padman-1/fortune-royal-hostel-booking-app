import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ACRooms extends StatefulWidget {
  const ACRooms({super.key});

  @override
  State<ACRooms> createState() => _ACRoomsState();
}

class _ACRoomsState extends State<ACRooms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Both Bedspaces are available',
          ),
        ),
      ),
    );
  }
}
