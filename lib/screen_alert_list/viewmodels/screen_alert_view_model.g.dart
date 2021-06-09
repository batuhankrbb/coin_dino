// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_alert_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScreenAlertViewModel on _ScreenAlertViewModelBase, Store {
  final _$alertsResultAtom =
      Atom(name: '_ScreenAlertViewModelBase.alertsResult');

  @override
  StateResult<List<AlertEntity>> get alertsResult {
    _$alertsResultAtom.reportRead();
    return super.alertsResult;
  }

  @override
  set alertsResult(StateResult<List<AlertEntity>> value) {
    _$alertsResultAtom.reportWrite(value, super.alertsResult, () {
      super.alertsResult = value;
    });
  }

  final _$addAlertAsyncAction =
      AsyncAction('_ScreenAlertViewModelBase.addAlert');

  @override
  Future<void> addAlert(AlertEntity alertEntity) {
    return _$addAlertAsyncAction.run(() => super.addAlert(alertEntity));
  }

  @override
  String toString() {
    return '''
alertsResult: ${alertsResult}
    ''';
  }
}
