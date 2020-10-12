import 'package:flutter_white_label/data/network/endpoints.dart';
import 'package:flutter_white_label/data/network/rest_client.dart';
import 'package:flutter_white_label/models/accounts_model.dart';

class AccountsViewModel {
  RestClient resClient = RestClient();

  // var getRes = await rc.get(Endpoints.getAccounts);
  Future<List<AccountsModel>> getAccounts() async {
    final response = await resClient.get(Endpoints.getAccounts);
    return profileFromJson(response.toString());
  }

  Future<List<AccountsModel>> authorized(String email, String password) async {
    final response =
        await resClient.get(Endpoints.getAccounts).then((value) => value);
    var resToJson = profileFromJson(response.toString());
    var result = resToJson
        .where((item) => item.email == email && item.password == password)
        .toList();
    return result;
  }
}
