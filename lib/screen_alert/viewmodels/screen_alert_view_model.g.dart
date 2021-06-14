// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_alert_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScreenAlertViewModel on _ScreenAlertViewModelBase, Store {
  final _$alertResultAtom = Atom(name: '_ScreenAlertViewModelBase.alertResult');

  @override
  StateResult<List<AlertEntity>> get alertResult {
    _$alertResultAtom.reportRead();
    return super.alertResult;
  }

  @override
  set alertResult(StateResult<List<AlertEntity>> value) {
    _$alertResultAtom.reportWrite(value, super.alertResult, () {
      super.alertResult = value;
    });
  }

  final _$addAlertAsyncAction =
      AsyncAction('_ScreenAlertViewModelBase.addAlert');

  @override
  Future<void> addAlert(AlertEntity alertEntity) {
    return _$addAlertAsyncAction.run(() => super.addAlert(alertEntity));
  }

  final _$getAllAlertsAsyncAction =
      AsyncAction('_ScreenAlertViewModelBase.getAllAlerts');

  @override
  Future<void> getAllAlerts() {
    return _$getAllAlertsAsyncAction.run(() => super.getAllAlerts());
  }

  final _$deleteAlertAsyncAction =
      AsyncAction('_ScreenAlertViewModelBase.deleteAlert');

  @override
  Future<void> deleteAlert(AlertEntity entity) {
    return _$deleteAlertAsyncAction.run(() => super.deleteAlert(entity));
  }

  final _$updateAlertAsyncAction =
      AsyncAction('_ScreenAlertViewModelBase.updateAlert');

  @override
  Future<void> updateAlert(AlertEntity entity) {
    return _$updateAlertAsyncAction.run(() => super.updateAlert(entity));
  }

  @override
  String toString() {
    return '''
alertResult: ${alertResult}
    ''';
  }
}
