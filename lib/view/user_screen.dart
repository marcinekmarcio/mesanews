import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mesa_news_projeto/exp_arq.dart';
import 'package:mesa_news_projeto/store/token_controller_store.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TokenStore tokenStore = new TokenStore();

    return Scaffold(
        backgroundColor: secondColor,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Container(
                    height: 100,
                    width: 200,
                    child: Image.asset("image/login_image.png"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: standardTextField(context, 'E-mail', _controllerEmail,
                      TextInputType.emailAddress, false),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: standardTextField(context, 'Senha', _controllerSenha,
                      TextInputType.visiblePassword, true),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: standardButton(
                      context, firstColor, secondColor, 'Login', 1, 50, () {
                    tokenStore.fetchToken(
                        context, _controllerEmail.text, _controllerSenha.text);
                  }),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Observer(
                      builder: (_) => textLabel(
                          context,
                          tokenStore.tokenText == false
                              ? "Ops! Usuario ou senha incorretos!"
                              : "",
                          12,
                          FontWeight.bold,
                          Colors.redAccent,
                          TextAlign.left,
                          1),
                    )),
              ],
            ),
            decoration: BoxDecoration(
              color: secondColor,
            ),
          ),
        ));
  }
}
