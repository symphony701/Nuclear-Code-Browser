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
              FilterHlist(),
              SizedBox(
                height: 20,
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ItemListDoujin(),
                  ItemListDoujin(),
                  ItemListDoujin(),
                  ItemListDoujin(),
                  ItemListDoujin(),
                  ItemListDoujin(),
                  ItemListDoujin(),
                  ItemListDoujin(),
                  ItemListDoujin(),
                  ItemListDoujin(),
                  ItemListDoujin(),
                  ItemListDoujin(),
                ],
              ),
            ],
          ),
        ));
  }
}
