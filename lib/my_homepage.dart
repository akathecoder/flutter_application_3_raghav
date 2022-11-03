import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        _launchUrl("https://www.instagram.com/rg12301/");
        break;
      case 1:
        _launchUrl("https://github.com/rg12301/");
        break;
      case 2:
        _launchUrl("https://facebook.com/");
        break;
      default:
    }
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.instagram),
            label: "Instagram",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.github),
            label: "GitHub",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.facebook),
            label: "FaceBook",
          ),
        ],
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
