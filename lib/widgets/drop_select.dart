import 'package:codes_browser/models/pages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropSelect extends StatefulWidget {
  final List<PageIncludedModel> pagesIncluded;
  final Function(String) selectPage;
  DropSelect({Key? key, required this.pagesIncluded, required this.selectPage})
      : super(key: key);

  @override
  State<DropSelect> createState() => _DropSelectState();
}

class _DropSelectState extends State<DropSelect> {
  List<DropdownMenuItem>? _dropDownMenuItems;
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _dropDownMenuItems = widget.pagesIncluded
        .map((e) => DropdownMenuItem(
              value: e.name,
              child: Text(e.name),
            ))
        .toList();
    setState(() {
      _selectedValue = _dropDownMenuItems![0].value;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      widget.selectPage(_selectedValue!);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.065,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: const Icon(Icons.arrow_drop_down,
              color: Color.fromARGB(255, 248, 25, 73), size: 40),
          value: _selectedValue,
          items: _dropDownMenuItems,
          onChanged: (value) {
            setState(() {
              _selectedValue = value.toString();
            });
            widget.selectPage(_selectedValue!);
          },
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
