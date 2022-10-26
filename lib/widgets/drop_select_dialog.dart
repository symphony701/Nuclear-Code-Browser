import 'package:codes_browser/models/pages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropSelectDialog extends StatefulWidget {
  final List<PageIncludedModel> pagesIncluded;
  final Function(String) selectPage;
  DropSelectDialog(
      {Key? key, required this.pagesIncluded, required this.selectPage})
      : super(key: key);

  @override
  State<DropSelectDialog> createState() => _DropSelectDialogState();
}

class _DropSelectDialogState extends State<DropSelectDialog> {
  List<DropdownMenuItem>? _dropDownMenuItems;
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _dropDownMenuItems = widget.pagesIncluded
        .map(
          (e) => DropdownMenuItem(
            value: e.name,
            child: Text(e.name,
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.w400)),
          ),
        )
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
          value: _selectedValue,
          items: _dropDownMenuItems,
          onChanged: (value) {
            setState(() {
              _selectedValue = value.toString();
              widget.selectPage(_selectedValue!);
            });
          },
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
