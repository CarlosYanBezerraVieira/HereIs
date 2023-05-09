import 'package:http/http.dart' as http;

import '../models/cep_model.dart';

class ViaCepService {
  static Future<CepModel> searchCEP({required String cep}) async {
    try {
      final url = Uri.parse('https://viacep.com.br/ws/$cep/json/');
      final response = await http.get(url).timeout(
            const Duration(seconds: 3),
          );

      return CepModel.fromJson(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}
