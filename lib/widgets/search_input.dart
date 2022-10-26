import 'package:codes_browser/models/pages.dart';
import 'package:codes_browser/widgets/add_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchInput extends StatefulWidget {
  final Function(String) changeCode;
  final List<PageIncludedModel> pagesIncluded;
  SearchInput({
    Key? key,
    required this.changeCode,
    required this.pagesIncluded,
  }) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  String? actualCode;
  @override
  Widget build(BuildContext context) {
    return Container(
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
              Expanded(
                child: Container(
                  padding: MediaQuery.of(context).size.width > 600
                      ? const EdgeInsets.only(left: 20)
                      : const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(8),
                    ],
                    onChanged: (value) {
                      widget.changeCode(value);
                      setState(() {
                        actualCode = value;
                      });
                    },
                    cursorColor: const Color.fromARGB(255, 248, 25, 73),
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
              GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => AddDialog(
                    pagesIncluded: widget.pagesIncluded,
                    actualCode: actualCode,
                  ),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.14,
                  height: MediaQuery.of(context).size.height * 0.065,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Color.fromARGB(255, 248, 25, 73),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
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
