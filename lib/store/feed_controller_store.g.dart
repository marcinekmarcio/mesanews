// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_controller_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedStore on _FeedStoreBase, Store {
  final _$getFavAtom = Atom(name: '_FeedStoreBase.getFav');

  @override
  bool get getFav {
    _$getFavAtom.reportRead();
    return super.getFav;
  }

  @override
  set getFav(bool value) {
    _$getFavAtom.reportWrite(value, super.getFav, () {
      super.getFav = value;
    });
  }

  final _$feedModelAtom = Atom(name: '_FeedStoreBase.feedModel');

  @override
  FeedModel get feedModel {
    _$feedModelAtom.reportRead();
    return super.feedModel;
  }

  @override
  set feedModel(FeedModel value) {
    _$feedModelAtom.reportWrite(value, super.feedModel, () {
      super.feedModel = value;
    });
  }

  final _$_FeedStoreBaseActionController =
      ActionController(name: '_FeedStoreBase');

  @override
  dynamic fetchFav(String fav) {
    final _$actionInfo = _$_FeedStoreBaseActionController.startAction(
        name: '_FeedStoreBase.fetchFav');
    try {
      return super.fetchFav(fav);
    } finally {
      _$_FeedStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchFavSwitch(String fav) {
    final _$actionInfo = _$_FeedStoreBaseActionController.startAction(
        name: '_FeedStoreBase.fetchFavSwitch');
    try {
      return super.fetchFavSwitch(fav);
    } finally {
      _$_FeedStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchFeed(String token) {
    final _$actionInfo = _$_FeedStoreBaseActionController.startAction(
        name: '_FeedStoreBase.fetchFeed');
    try {
      return super.fetchFeed(token);
    } finally {
      _$_FeedStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getFav: ${getFav},
feedModel: ${feedModel}
    ''';
  }
}
