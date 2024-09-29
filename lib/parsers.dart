import 'dart:convert';

class Parsers {
  static (int, int) parsePositionForGps(String message) {
    final List<int> coords = _parseCoords(message);
    return (coords[0], coords[1]);
  }

  static (int, int) parsePositionForBike(String message) {
    final List<int> coords = _parseCoords(message);
    return (coords[2], coords[3]);
  }

  static List<int> _parseCoords(String message) {
    final Map<String, dynamic> messageJson = jsonDecode(message);
    final List<int> resultCoords = [];

    final List<dynamic> coordinates = List.from(messageJson["coordinates"]);
    for (dynamic coord in coordinates) {
      resultCoords.add(coord);
    }

    return resultCoords;
  }
}
