// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CoursesController on _CoursesControllerBase, Store {
  Computed<List<CoursesModel>>? _$coursesModelListComputed;

  @override
  List<CoursesModel> get coursesModelList => (_$coursesModelListComputed ??=
          Computed<List<CoursesModel>>(() => super.coursesModelList,
              name: '_CoursesControllerBase.coursesModelList'))
      .value;

  late final _$_coursesModelListAtom =
      Atom(name: '_CoursesControllerBase._coursesModelList', context: context);

  @override
  List<CoursesModel> get _coursesModelList {
    _$_coursesModelListAtom.reportRead();
    return super._coursesModelList;
  }

  @override
  set _coursesModelList(List<CoursesModel> value) {
    _$_coursesModelListAtom.reportWrite(value, super._coursesModelList, () {
      super._coursesModelList = value;
    });
  }

  late final _$getListAsyncAction =
      AsyncAction('_CoursesControllerBase.getList', context: context);

  @override
  Future<dynamic> getList() {
    return _$getListAsyncAction.run(() => super.getList());
  }

  @override
  String toString() {
    return '''
coursesModelList: ${coursesModelList}
    ''';
  }
}
