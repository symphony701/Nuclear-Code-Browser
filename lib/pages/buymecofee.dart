import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BuyMeCofeeView extends StatefulWidget {
  BuyMeCofeeView({Key? key}) : super(key: key);

  @override
  State<BuyMeCofeeView> createState() => _BuyMeCofeeViewState();
}

class _BuyMeCofeeViewState extends State<BuyMeCofeeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(137, 31, 31, 31),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Hey, thanks for using my app!',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              'Hey, I am Seb, a simple Software Engineer Student. I made this app for fun and to learn Flutter. If you like it, you can buy me a coffee to support me. Thanks!',
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              child: Image(image: Image.asset('assets/buymeacofee.png').image),
              onTap: () async {
                final uri = Uri.parse('https://www.buymeacoffee.com/armonyrn');
                if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {
                  throw 'Could not launch $uri';
                }
              },
            )
          ],
        ),
      )),
    );
  }
}
