import 'package:mesa_news_projeto/function/function.dart';
import 'package:mesa_news_projeto/model_api/token_api_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import '../exp_arq.dart';
part 'token_controller_store.g.dart';

class TokenStore = _TokenStoreBase with _$TokenStore;

abstract class _TokenStoreBase with Store {
  @observable
  bool tokenText = true;

  @action
  setTokenText(bool newValue) {
    tokenText = newValue;
  }

  @observable
  TokenModel tokenModel;

  @action
  fetchToken(BuildContext context, String user, String password) {
    getToken(context, user, password).then((value) {
      setTokenText(value);
    });
  }

  Future<bool> getToken(
      BuildContext context, String user, String password) async {
    try {
      final response = await http.post(Uri.parse(
          "https://mesa-news-api.herokuapp.com/v1/client/auth/signin?email=$user&password=$password"));
      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);
        //salveTokenApp(TokenModel.fromJson(decodeJson).token);

        Navigator.pushNamedAndRemoveUntil(context, "/news_feed", (r) => false,
            arguments: TokenModel.fromJson(decodeJson).token);
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print('Erro api token');
      return null;
    }
  }
}
