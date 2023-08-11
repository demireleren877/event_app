// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapVM on _MapVMBase, Store {
  late final _$markersAtom = Atom(name: '_MapVMBase.markers', context: context);

  @override
  ObservableMap<String, Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(ObservableMap<String, Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  late final _$getLocationsAsyncAction =
      AsyncAction('_MapVMBase.getLocations', context: context);

  @override
  Future getLocations(dynamic context, CustomInfoWindowController controller) {
    return _$getLocationsAsyncAction
        .run(() => super.getLocations(context, controller));
  }

  @override
  String toString() {
    return '''
markers: ${markers}
    ''';
  }
}
