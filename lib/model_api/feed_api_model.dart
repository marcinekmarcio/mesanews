class FeedModel {
  Pagination pagination;
  List<Feed> feed;

  FeedModel({this.pagination, this.feed});

  FeedModel.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      feed = <Feed>[];
      json['data'].forEach((v) {
        feed.add(new Feed.fromJson(v));
      });
    }
  }
}

class Pagination {
  int currentPage;
  int perPage;
  int totalPages;
  int totalItems;

  Pagination(
      {this.currentPage, this.perPage, this.totalPages, this.totalItems});

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    perPage = json['per_page'];
    totalPages = json['total_pages'];
    totalItems = json['total_items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['per_page'] = this.perPage;
    data['total_pages'] = this.totalPages;
    data['total_items'] = this.totalItems;
    return data;
  }
}

class Feed {
  String title;
  String description;
  String content;
  String author;
  String publishedAt;
  bool highlight;
  String url;
  String imageUrl;
  //Future<bool> fav;

  Feed({
    this.title,
    this.description,
    this.content,
    this.author,
    this.publishedAt,
    this.highlight,
    this.url,
    this.imageUrl,
    //this.fav
  });

  Feed.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    content = json['content'];
    author = json['author'];
    publishedAt = json['published_at'];
    highlight = json['highlight'];
    url = json['url'];
    imageUrl = json['image_url'];
    //fav = getFavorite(json['image_url']);
  }
}
