import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3_raghav/image_page.dart';
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
    List images = [
      "https://i.picsum.photos/id/743/1080/1920.jpg?hmac=RvGxnYrwqtE3kqI8ICz34JUv4pxO42BKzuZGjYFj5ss",
      "https://i.picsum.photos/id/315/1080/1920.jpg?hmac=jJwKgQg9wIwh80H52ANGgK53I0dEQs74BCx8-ZjnLDI",
      "https://i.picsum.photos/id/576/1080/1920.jpg?hmac=TwGgbCLuXkT7Uu41W5AVcG5jpiv6kBebu6Qv4Ktbu6c",
      "https://i.picsum.photos/id/514/1080/1920.jpg?hmac=W9HSpDWz0ISVRsHol2miHGJINKCOMM-M0Zmr4-B4Lfo",
      "https://i.picsum.photos/id/415/1080/1920.jpg?hmac=Ni4XBJTexMi1FEq5MrGqNsGksg10EzoNrpMqInK-VeQ",
      "https://i.picsum.photos/id/618/1080/1920.jpg?hmac=jECgxQudPKJiRA7jFv64jxuzL4O_KbP9EO2Yej-QT58",
      "https://i.picsum.photos/id/859/1080/1920.jpg?hmac=7Qy_WZovzz76LdKCdANtz_fj3w_rgUxwSekulXRyy_I",
    ];

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
        child: Center(
          child: CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImagePage(
                        title: "Video Player",
                        link: images[itemIndex],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(color: Colors.amber),
                  child: Image.network(
                    images[itemIndex],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            options: CarouselOptions(height: 400.0),
          ),
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
