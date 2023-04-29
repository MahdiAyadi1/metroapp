import 'dart:convert';
import 'package:http/http.dart' as http;

Future<int> predict(List input) async {
  // Préparer les données d'entrée sous forme de JSON
  final inputJson = {
    "Ligne": input[0],
    "Day": input[1],
    "Time": input[2],
    "Distance": input[3],
    "Direction_Metro": input[4],
    "Num Station": input[5]
  };
  final inputJsonString = jsonEncode(inputJson);

  // Effectuer la demande POST vers l'API Python
  final response = await http.post(Uri.parse('https://timemetroprediction.onrender.com/predict'),
      body: inputJsonString,
      headers: {'Content-Type': 'application/json'});

  // Récupérer la réponse sous forme de JSON
  final outputJson = jsonDecode(response.body);

  // Convertir la réponse en liste de doubles et la renvoyer
  final output = outputJson;
  return output.round();
}
