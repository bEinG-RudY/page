import 'dart:convert';
import 'package:http/http.dart' as http;

class ProgramQueryModel {
  getPrograms() async {
    var response = await http.get(
        Uri.parse("https://632017e19f82827dcf24a655.mockapi.io/api/programs"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Data not found");
    }
  }
}
