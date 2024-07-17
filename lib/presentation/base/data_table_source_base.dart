import 'package:flutter/material.dart';

abstract class DataTableSourceBase<T> extends DataTableSource {

  final List<T> list;

  DataTableSourceBase({
    required this.list
  });
  
  @override
  bool get isRowCountApproximate => false;
  
  @override
  int get rowCount => list.length;
  
  @override
  int get selectedRowCount => 0;
}