import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mesa_news_projeto/exp_arq.dart';
import 'package:mesa_news_projeto/model_api/feed_api_model.dart';
import 'package:mesa_news_projeto/store/feed_controller_store.dart';
import 'news_webview_screen.dart';

class NewsFeedScreen extends StatefulWidget {
  String token = "";
  NewsFeedScreen(this.token);
  @override
  _NewsFeedScreenState createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  @override
  Widget build(BuildContext context) {
    FeedStore feedStore = FeedStore();
    feedStore.fetchFeed(widget.token);

    return Container(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: firstColor,
            elevation: 0.0,
            title: Center(
              child: textLabel(context, 'Mesa News', 18, FontWeight.bold,
                  secondColor, TextAlign.left, 1),
            ),
          ),
          backgroundColor: secondColor,
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: textLabel(context, 'Últimas notícias', 15,
                        FontWeight.bold, Colors.black, TextAlign.left, 1),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 50,
                    child: Observer(
                      builder: (BuildContext context) {
                        FeedModel _feedModel = feedStore.feedModel;
                        return (feedStore.feedModel != null)
                            ? ListView.builder(
                                itemCount: _feedModel.feed.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    NewsWebViewScreen(_feedModel
                                                        .feed[index].url)));
                                      },
                                      child: feedBox(
                                          context,
                                          widget.token,
                                          _feedModel.feed[index].imageUrl,
                                          _feedModel.feed[index].publishedAt,
                                          _feedModel.feed[index].title,
                                          _feedModel.feed[index].description));
                                })
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
