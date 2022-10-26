import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemListDoujin extends StatefulWidget {
  ItemListDoujin({Key? key}) : super(key: key);

  @override
  State<ItemListDoujin> createState() => _ItemListDoujinState();
}

class _ItemListDoujinState extends State<ItemListDoujin> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Este es el Tag',
        style: GoogleFonts.poppins(color: Colors.white),
      ),
      subtitle: Text(
        'Hitomi.la 75790207',
        style: GoogleFonts.poppins(color: Colors.white),
      ),
      onTap: () {
        print('aaaa');
      },
      trailing: Wrap(
        spacing: 12, // space between two icons
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
