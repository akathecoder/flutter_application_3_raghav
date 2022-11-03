import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key, required this.title, required this.link});

  final String title;
  final String link;

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.blue,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Image.network(
            widget.link,
          ),
        ],
      )),
    );
  }
}
