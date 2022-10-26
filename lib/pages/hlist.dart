import 'package:codes_browser/models/doujin.dart';
import 'package:codes_browser/services/doujin_service.dart';
import 'package:codes_browser/widgets/filtrer_hlist.dart';
import 'package:codes_browser/widgets/item_list_doujin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HlistView extends StatefulWidget {
  HlistView({Key? key}) : super(key: key);

  @override
  State<HlistView> createState() => _HlistViewState();
}

class _HlistViewState extends State<HlistView> {
  DoujinService doujinService = const DoujinService();
  List<Doujin> doujins = [];

  Future<void> getDoujins() async {
    doujins = await doujinService.getDoujins();
    setState(() {});
  }

  void refresh() {
    getDoujins();
  }

  @override
  void initState() {
    getDoujins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(137, 31, 31, 31),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Your HList',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              FilterHlist(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                    'Advice: You can filter your HList by tags. You can view the doujins by clicking on them.',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: doujins.length,
                itemBuilder: (context, index) {
                  return ItemListDoujin(
                    doujin: doujins[index],
                    refresh: refresh,
                  );
                },
              ),
            ],
          ),
        ));
  }
}
