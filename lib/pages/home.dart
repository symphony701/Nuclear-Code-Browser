import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String code = '';

  Future<void> openSearcher() async {
    if (code.isEmpty) return;
    if (code.length <= 6) {
      String url = 'https://nhentai.net/g/$code/';
      final uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {
        throw 'Could not launch $uri';
      }
    }
    if (code.length > 6) {
      String url = 'https://hitomi.la/reader/$code.html#1';
      final uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
        throw 'Could not launch $uri';
      }
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(137, 31, 31, 31),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.065,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.14,
                              height:
                                  MediaQuery.of(context).size.height * 0.065,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                color: Color.fromARGB(255, 248, 25, 73),
                              ),
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: MediaQuery.of(context).size.width > 600
                                    ? const EdgeInsets.only(left: 20)
                                    : const EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(7),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      code = value;
                                    });
                                  },
                                  cursorColor:
                                      const Color.fromARGB(255, 248, 25, 73),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Insert a code',
                                    hintStyle: GoogleFonts.poppins(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      openSearcher();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.065,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 248, 25, 73),
                      ),
                      child: Center(
                        child: Text(
                          'Search',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Text(
                    'Pages Included',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Image(
                    image: const AssetImage('assets/nhentai.png'),
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'NHentai',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Image(
                    image: const AssetImage('assets/hitomi.png'),
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'Hitomi',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
