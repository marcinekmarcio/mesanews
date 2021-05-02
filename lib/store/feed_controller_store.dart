import 'package:mesa_news_projeto/function/function.dart';
import 'package:mesa_news_projeto/model_api/feed_api_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import '../exp_arq.dart';
part 'feed_controller_store.g.dart';

class FeedStore = _FeedStoreBase with _$FeedStore;

abstract class _FeedStoreBase with Store {
  @observable
  bool getFav = false;

  @action
  fetchFav(String fav) {
    getFavorite(fav).then((value) {
      getFav = value;
    });
  }

  @action
  fetchFavSwitch(String fav) {
    getFavorite(fav).then((value) {
      if (value == true) {
        removeFavorite(fav);
        getFav = false;
      } else {
        salveFavorite(fav);
        getFav = true;
      }
    });
  }

  @observable
  FeedModel feedModel;

  @action
  fetchFeed(String token) {
    feedModel = null;
    getFeed(token).then((value) {
      feedModel = value;
    });
  }

  Future<FeedModel> getFeed(String token) async {
    try {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '$token'
      };

      final response = await http.get(
          Uri.parse("https://mesa-news-api.herokuapp.com/v1/client/news"),
          headers: requestHeaders);
      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);
        return FeedModel.fromJson(decodeJson);
      } else {
        return null;
      }
    } catch (error) {
      print('Erro api token');
      return null;
    }
  }
}
