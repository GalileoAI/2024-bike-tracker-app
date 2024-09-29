import 'dart:convert';

class Parsers {
  static (int, int) parsePositionForGps(String message) {
    List<int> coords = _parseCoords(message);

    return (coords[0], coords[1]);
  }

  static (int, int) parsePositionForBike(String message) {
    List<int> coords = _parseCoords(message);

    return (coords[2], coords[3]);
  }

  static _parseCoords(String message) {
    Map<String, dynamic> messageJson = jsonDecode(message);
    List<int> resultCoords = [];

    List<dynamic> coordinates = List.from(messageJson["coordinates"]);
    for (dynamic coord in coordinates) {
      resultCoords.add(coord);
    }
    
    return resultCoords;
  }
}
