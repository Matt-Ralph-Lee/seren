import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MatchedPage extends StatelessWidget {
  const MatchedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("match!!", style: TextStyle(color: Colors.white))),
      body: ElevatedButton(
        onPressed: () => context.pop(),
        child: const Text("back", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
