import 'package:codes_browser/models/pages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageIncluded extends StatefulWidget {
  final PageIncludedModel pageIncludedModel;
  PageIncluded({Key? key, required this.pageIncludedModel}) : super(key: key);

  @override
  State<PageIncluded> createState() => _PageIncludedState();
}

class _PageIncludedState extends State<PageIncluded> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image(
            image: AssetImage(widget.pageIncludedModel.image),
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Text(
            widget.pageIncludedModel.name,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
