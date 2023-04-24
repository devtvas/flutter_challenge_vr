// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StudentsController on _StudentsControllerBase, Store {
  Computed<List<StudentModel>>? _$studentModelListComputed;

  @override
  List<StudentModel> get studentModelList => (_$studentModelListComputed ??=
          Computed<List<StudentModel>>(() => super.studentModelList,
              name: '_StudentsControllerBase.studentModelList'))
      .value;

  late final _$_studentModelListAtom =
      Atom(name: '_StudentsControllerBase._studentModelList', context: context);

  @override
  List<StudentModel> get _studentModelList {
    _$_studentModelListAtom.reportRead();
    return super._studentModelList;
  }

  @override
  set _studentModelList(List<StudentModel> value) {
    _$_studentModelListAtom.reportWrite(value, super._studentModelList, () {
      super._studentModelList = value;
    });
  }

  late final _$getListAsyncAction =
      AsyncAction('_StudentsControllerBase.getList', context: context);

  @override
  Future<dynamic> getList() {
    return _$getListAsyncAction.run(() => super.getList());
  }

  @override
  String toString() {
    return '''
studentModelList: ${studentModelList}
    ''';
  }
}
