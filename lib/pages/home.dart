import 'package:codes_browser/models/pages.dart';
import 'package:codes_browser/widgets/drop_select.dart';
import 'package:codes_browser/widgets/page_included.dart';
import 'package:codes_browser/widgets/search_input.dart';
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
  String? pageSelected;

  List<PageIncludedModel> pagesIncluded = [
    PageIncludedModel(
      name: 'NHentai',
      url: 'https://nhentai.net/',
      image: 'assets/nhentai.png',
    ),
    PageIncludedModel(
      name: 'Hitomi',
      url: 'https://hitomi.la/',
      image: 'assets/hitomi.png',
    ),
    PageIncludedModel(
      name: '3Hentai',
      url: 'https://3hentai.net',
      image: 'assets/3hentai.png',
    ),
  ];

  Future<void> openSearcher() async {
    print(pageSelected);
    if (code.isEmpty) return;
    if (pageSelected == 'NHentai') {
      String url = 'https://nhentai.net/g/$code/';
      final uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {
        throw 'Could not launch $uri';
      }
    }
    if (pageSelected == 'Hitomi') {
      String url = 'https://hitomi.la/reader/$code.html#1';
      final uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
        throw 'Could not launch $uri';
      }
    }
    if (pageSelected == '3Hentai') {
      String url = 'https://3hentai.net/d/$code/';
      final uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {
        throw 'Could not launch $uri';
      }
    }
    return;
  }

  void changeCode(String value) {
    setState(() {
      code = value;
    });
  }

  void selectPage(String value) {
    setState(() {
      pageSelected = value;
    });
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
                  SearchInput(
                    changeCode: changeCode,
                  ),
                  DropSelect(
                    pagesIncluded: pagesIncluded,
                    selectPage: selectPage,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
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
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent:
                              MediaQuery.of(context).size.height * 0.3,
                          crossAxisCount: 2),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: pagesIncluded.length,
                      itemBuilder: ((context, index) {
                        return GridTile(
                          child: PageIncluded(
                            pageIncludedModel: pagesIncluded[index],
                          ),
                        );
                      }))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
