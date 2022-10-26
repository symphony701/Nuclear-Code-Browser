import 'package:codes_browser/models/doujin.dart';
import 'package:codes_browser/services/doujin_service.dart';
import 'package:codes_browser/services/filter_service.dart';
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
  FilterService filterService = FilterService();
  List<Doujin> doujins = [];
  List<Doujin> doujinsFiltered = [];
  String _filterHelper = '';

  Future<void> getDoujins() async {
    doujins = await doujinService.getDoujins();
    doujinsFiltered = doujins;
    setState(() {});
  }

  void refresh() async {
    if (_filterHelper.isEmpty) {
      getDoujins();
    } else if (_filterHelper.isNotEmpty) {
      await getDoujins();
      doujinsFiltered = filterService.filterDoujins(doujins, _filterHelper);
      setState(() {});
    }
  }

  void onFilter(String value) {
    value.isEmpty
        ? doujinsFiltered = doujins
        : doujinsFiltered = filterService.filterDoujins(doujins, value);
    value.isNotEmpty ? _filterHelper = value : _filterHelper = '';
    setState(() {});
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
              FilterHlist(onFilter: onFilter),
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
              doujins.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: doujinsFiltered.length,
                      itemBuilder: (context, index) {
                        return ItemListDoujin(
                          doujin: doujinsFiltered[index],
                          refresh: refresh,
                        );
                      },
                    )
                  : Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Eh, you don\'t have any doujins in your HList yet. Back to the home page and add some doujins to your HList!',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
            ],
          ),
        ));
  }
}
