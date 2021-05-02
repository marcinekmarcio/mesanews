import 'package:mesa_news_projeto/exp_arq.dart';

class NewsWebViewScreen extends StatefulWidget {
  String url = "";
  NewsWebViewScreen(this.url);

  @override
  _NewsWebViewScreenState createState() => _NewsWebViewScreenState();
}

class _NewsWebViewScreenState extends State<NewsWebViewScreen> {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.url,
    );
  }
}
