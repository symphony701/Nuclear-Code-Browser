import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterHlist extends StatefulWidget {
  FilterHlist({Key? key}) : super(key: key);

  @override
  State<FilterHlist> createState() => _FilterHlistState();
}

class _FilterHlistState extends State<FilterHlist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 248, 25, 73),
          width: 1,
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: GoogleFonts.poppins(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
