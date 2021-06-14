import 'package:flutter/material.dart';

class ResourceThirdPage extends StatefulWidget {
  const ResourceThirdPage({Key? key}) : super(key: key);

  @override
  _ResourceThirdPageState createState() => _ResourceThirdPageState();
}

class _ResourceThirdPageState extends State<ResourceThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('资源三级页面'),
      ),
    );
  }
}
