// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$lastMapPositionAtom =
      Atom(name: '_HomeControllerBase.lastMapPosition');

  @override
  LatLng get lastMapPosition {
    _$lastMapPositionAtom.context.enforceReadPolicy(_$lastMapPositionAtom);
    _$lastMapPositionAtom.reportObserved();
    return super.lastMapPosition;
  }

  @override
  set lastMapPosition(LatLng value) {
    _$lastMapPositionAtom.context.conditionallyRunInAction(() {
      super.lastMapPosition = value;
      _$lastMapPositionAtom.reportChanged();
    }, _$lastMapPositionAtom, name: '${_$lastMapPositionAtom.name}_set');
  }

  final _$markersAtom = Atom(name: '_HomeControllerBase.markers');

  @override
  Set<Marker> get markers {
    _$markersAtom.context.enforceReadPolicy(_$markersAtom);
    _$markersAtom.reportObserved();
    return super.markers;
  }

  @override
  set markers(Set<Marker> value) {
    _$markersAtom.context.conditionallyRunInAction(() {
      super.markers = value;
      _$markersAtom.reportChanged();
    }, _$markersAtom, name: '${_$markersAtom.name}_set');
  }

  final _$getUserLocationAsyncAction = AsyncAction('getUserLocation');

  @override
  Future getUserLocation() {
    return _$getUserLocationAsyncAction.run(() => super.getUserLocation());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setMarkers() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setMarkers();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLastMapPosition(LatLng position) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setLastMapPosition(position);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'lastMapPosition: ${lastMapPosition.toString()},markers: ${markers.toString()}';
    return '{$string}';
  }
}
