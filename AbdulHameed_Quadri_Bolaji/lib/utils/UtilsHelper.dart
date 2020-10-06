
class UtilsHelper {
  static String extractStringFromList(List<String> items) {
    String result = '';
    if (items.isEmpty)
      result = 'All';
    else {
      for (int x = 0; x < items.length; x++) {
        result += items[x];
        if (x < items.length - 1) result += ', ';
      }
    }
    return result;
  }
}
