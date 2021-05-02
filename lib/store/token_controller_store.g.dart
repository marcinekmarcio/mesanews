// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_controller_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TokenStore on _TokenStoreBase, Store {
  final _$tokenTextAtom = Atom(name: '_TokenStoreBase.tokenText');

  @override
  bool get tokenText {
    _$tokenTextAtom.reportRead();
    return super.tokenText;
  }

  @override
  set tokenText(bool value) {
    _$tokenTextAtom.reportWrite(value, super.tokenText, () {
      super.tokenText = value;
    });
  }

  final _$tokenModelAtom = Atom(name: '_TokenStoreBase.tokenModel');

  @override
  TokenModel get tokenModel {
    _$tokenModelAtom.reportRead();
    return super.tokenModel;
  }

  @override
  set tokenModel(TokenModel value) {
    _$tokenModelAtom.reportWrite(value, super.tokenModel, () {
      super.tokenModel = value;
    });
  }

  final _$_TokenStoreBaseActionController =
      ActionController(name: '_TokenStoreBase');

  @override
  dynamic setTokenText(bool newValue) {
    final _$actionInfo = _$_TokenStoreBaseActionController.startAction(
        name: '_TokenStoreBase.setTokenText');
    try {
      return super.setTokenText(newValue);
    } finally {
      _$_TokenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchToken(BuildContext context, String user, String password) {
    final _$actionInfo = _$_TokenStoreBaseActionController.startAction(
        name: '_TokenStoreBase.fetchToken');
    try {
      return super.fetchToken(context, user, password);
    } finally {
      _$_TokenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tokenText: ${tokenText},
tokenModel: ${tokenModel}
    ''';
  }
}
