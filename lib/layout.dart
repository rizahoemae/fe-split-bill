import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({super.key, required this.child, required this.title});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(backgroundColor: Colors.white, title: Text(title)),
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Container(
          child: child,
          decoration: BoxDecoration(color: Colors.white),
        ),
      ),
    );
  }
}
