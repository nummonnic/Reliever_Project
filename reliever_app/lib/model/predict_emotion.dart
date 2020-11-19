import 'dart:convert';
import 'package:http/http.dart' as http;

//Method to predict the diary
  Future<String> predictEmotion(var body) async {
    var client = new http.Client();
    var uri = Uri.parse("https://emotionreliever.herokuapp.com/predict");
    Map<String, String> headers = {"Content-type": "application/json"};
    String jsonString = json.encode(body);
    
    try {
      var resp = await client.post(uri, headers: headers, body: jsonString);
      // var resp=await http.get(Uri.parse("https://emotionreliever.herokuapp.com/predict"));
      print("response body: ${resp.body}");
      if (resp.statusCode == 200) {
        print("DATA FETCHED SUCCESSFULLY");
        var result = json.decode(resp.body);
        print("result: " + result["result"]);
        return result["result"];
      }
    } catch (e) {
      print("EXCEPTION OCCURRED: $e");
      return null;
    }
    return null;
  }