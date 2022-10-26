import 'package:codes_browser/models/doujin.dart';
import 'package:codes_browser/services/doujin_service.dart';
import 'package:codes_browser/widgets/edit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemListDoujin extends StatefulWidget {
  final Doujin doujin;
  final Function refresh;
  ItemListDoujin({Key? key, required this.doujin, required this.refresh})
      : super(key: key);

  @override
  State<ItemListDoujin> createState() => _ItemListDoujinState();
}

class _ItemListDoujinState extends State<ItemListDoujin> {
  DoujinService doujinService = const DoujinService();

  void openInBrowser() async {
    switch (widget.doujin.page) {
      case 'NHentai':
        String url = 'https://nhentai.net/g/${widget.doujin.code}/';
        final uri = Uri.parse(url);
        if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {
          throw 'Could not launch $uri';
        }
        break;
      case 'Hitomi':
        String url = 'https://hitomi.la/reader/${widget.doujin.code}.html#1';
        final uri = Uri.parse(url);
        if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
          throw 'Could not launch $uri';
        }
        break;
      case '3Hentai':
        String url = 'https://3hentai.net/d/${widget.doujin.code}/';
        final uri = Uri.parse(url);
        if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {
          throw 'Could not launch $uri';
        }
        break;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.doujin.tag,
        style: GoogleFonts.poppins(color: Colors.white),
      ),
      subtitle: Text(
        '${widget.doujin.page} - ${widget.doujin.code}',
        style: GoogleFonts.poppins(color: Colors.white),
      ),
      onTap: () {
        openInBrowser();
      },
      trailing: Wrap(
        spacing: 12, // space between two icons
        children: [
          IconButton(
            onPressed: () async {
              await doujinService.deleteDoujin(widget.doujin);
              widget.refresh();
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              await showDialog(
                  context: context,
                  builder: (context) => EditDialog(
                      doujin: widget.doujin, refresh: widget.refresh));
            },
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
