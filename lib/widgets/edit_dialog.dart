import 'package:auto_size_text/auto_size_text.dart';
import 'package:codes_browser/models/doujin.dart';
import 'package:codes_browser/models/pages.dart';
import 'package:codes_browser/services/doujin_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class EditDialog extends StatefulWidget {
  final Doujin doujin;
  final Function refresh;
  EditDialog({Key? key, required this.doujin, required this.refresh})
      : super(key: key);

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  String code = '';
  String tag = '';
  String _selectPage = '';
  DoujinService doujinService = const DoujinService();
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

  List<DropdownMenuItem<String>> _dropDownMenuItems = [];

  @override
  void initState() {
    code = widget.doujin.code;
    _selectPage = widget.doujin.page;
    tag = widget.doujin.tag;
    _dropDownMenuItems = pagesIncluded
        .map(
          (e) => DropdownMenuItem(
            value: e.name,
            child: Text(e.name,
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.w400)),
          ),
        )
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color.fromARGB(255, 31, 31, 31),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                'Edit Dōjinshi',
                maxLines: 1,
                minFontSize: 20,
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              TextFormField(
                initialValue: widget.doujin.code,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(8),
                ],
                onChanged: (value) {
                  setState(() {
                    code = value;
                  });
                },
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  hintText: 'Code',
                  hintStyle: GoogleFonts.poppins(
                      color: Colors.grey, fontWeight: FontWeight.w400),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    tag = value;
                  });
                },
                initialValue: widget.doujin.tag,
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  hintText: 'Tag',
                  hintStyle: GoogleFonts.poppins(
                      color: Colors.grey, fontWeight: FontWeight.w400),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white, width: 1),
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.065,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    dropdownColor: const Color.fromARGB(255, 31, 31, 31),
                    icon: const Icon(Icons.arrow_drop_down,
                        color: Color.fromARGB(255, 248, 25, 73), size: 40),
                    value: _selectPage,
                    items: _dropDownMenuItems,
                    onChanged: (value) {
                      setState(() {
                        _selectPage = value.toString();
                      });
                    },
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 248, 25, 73),
                ),
                child: TextButton(
                  onPressed: () async {
                    if (code.isNotEmpty &&
                        tag.isNotEmpty &&
                        _selectPage.isNotEmpty) {
                      await doujinService.updateDoujin(
                          Doujin(
                            code: code,
                            tag: tag,
                            page: _selectPage,
                          ),
                          widget.doujin.key);
                      widget.refresh();
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    }
                  },
                  child: AutoSizeText(
                    'Update',
                    maxLines: 1,
                    minFontSize: 20,
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
