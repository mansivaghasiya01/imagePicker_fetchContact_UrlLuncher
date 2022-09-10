import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UrlLauncher extends StatefulWidget {
  const UrlLauncher({Key? key}) : super(key: key);

  @override
  State<UrlLauncher> createState() => _UrlLauncherState();
}

class _UrlLauncherState extends State<UrlLauncher> {
  //------------------------------ variable ----------------------------------
  final String lat = "25.3622";
  final String lng = "86.0835";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Url Launcher Demo"),
      ),
      body: urlLuncherScreen(),
    );
  }

//-------------------------------------- helper finction ---------------------------------
  Widget urlLuncherScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.blue, width: 2.0),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.open_in_browser,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: _launchURL,
                  child: const Text(
                    "Open web url",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
        Card(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.blue, width: 2.0),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: _launchEmail,
                  child: const Text(
                    "Open Email",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
        Card(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.blue, width: 2.0),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.navigation_outlined,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: _launchMap,
                  child: const Text(
                    "Open Map",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

//------------------------------------- map function -------------------------------------

  _launchMap() async {
    final String googleMapsUrl = "comgooglemaps://?center=$lat,$lng";
    final String appleMapsUrl = "https://maps.apple.com/?q=$lat,$lng";

    if (await canLaunchUrlString(googleMapsUrl)) {
      await launchUrlString(googleMapsUrl);
    }
    if (await canLaunchUrlString(appleMapsUrl)) {
      await launchUrlString(appleMapsUrl);
    } else {
      throw "Couldn't Launch URL";
    }
  }

//------------------------------------- email function ------------------------------------

  _launchEmail() async {
    launchUrlString("mailto:smith@example.org?subject=News&body=New%20plugin");
  }

//------------------------------------- function ------------------------------------------
  _launchURL() async {
    String url = "https://flutterdevs.com/";
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
