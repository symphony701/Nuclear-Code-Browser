import 'package:auto_size_text/auto_size_text.dart';
import 'package:codes_browser/models/pages.dart';
import 'package:codes_browser/widgets/drop_select_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDialog extends StatefulWidget {
  final List<PageIncludedModel> pagesIncluded;
  String? actualCode;
  AddDialog({Key? key, required this.pagesIncluded, this.actualCode})
      : super(key: key);

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  String code = '';
  String tag = '';
  String? pageSelected;

  void selectPage(String value) {
    setState(() {
      pageSelected = value;
    });
  }

  @override
  void initState() {
    super.initState();
    code = widget.actualCode ?? '';
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
                'Add Dōjinshi',
                maxLines: 1,
                minFontSize: 20,
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              AutoSizeText(
                'Enter the code and some tag of the Dōjinshi you want to add to your HList',
                maxLines: 2,
                minFontSize: 15,
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              TextFormField(
                initialValue: widget.actualCode,
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
              DropSelectDialog(
                pagesIncluded: widget.pagesIncluded,
                selectPage: selectPage,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 248, 25, 73),
                ),
                child: TextButton(
                  onPressed: () {
                    print('code: $code , tag: $tag , page: $pageSelected');
                  },
                  child: AutoSizeText(
                    'Add',
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
