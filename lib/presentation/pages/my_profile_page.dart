import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../shared/constants/page_path.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "My Profile Page",
        style: TextStyle(color: Colors.white),
      )),
      body: ElevatedButton(
        onPressed: () => context.push(PagePath.calendar),
        child: const Text(
          "see all memories",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
