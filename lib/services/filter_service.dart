import 'package:codes_browser/models/doujin.dart';

class FilterService {
  List<Doujin> filterDoujins(List<Doujin> doujins, String filter) {
    List<Doujin> doujinsFiltered = [];
    for (var doujin in doujins) {
      if (doujin.tag.toLowerCase().contains(filter.toLowerCase())) {
        doujinsFiltered.add(doujin);
      }
    }
    return doujinsFiltered;
  }
}
