import 'package:flutter/material.dart';

class AmbassadorsScreen extends StatefulWidget {
  const AmbassadorsScreen({super.key});

  @override
  State<AmbassadorsScreen> createState() => _AmbassadorsScreenState();
}

class _AmbassadorsScreenState extends State<AmbassadorsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
