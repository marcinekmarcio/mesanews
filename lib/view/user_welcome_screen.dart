import 'package:mesa_news_projeto/exp_arq.dart';
import 'package:connectivity/connectivity.dart';

class UserWelcomeScreen extends StatefulWidget {
  @override
  _UserWelcomeScreenState createState() => _UserWelcomeScreenState();
}

class _UserWelcomeScreenState extends State<UserWelcomeScreen> {
  _goToUserScreen() {
    Navigator.pushNamedAndRemoveUntil(context, "/user", (r) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          logoMesa(200, 400),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: standardButton(context, Colors.white, Colors.blueAccent,
                'Entrar com e-mail', 1, 50, _goToUserScreen),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: firstColor,
      ),
    );
  }
}
