class DataTableDataBase<T> {

  final bool isLoading;
  final int sortColumnIndex;
  final bool sortAscending;
  final List<T> list;

  const DataTableDataBase({
    this.list = const [],
    this.sortColumnIndex = -1,
    this.sortAscending = false,
    this.isLoading = false
  });

  DataTableDataBase<T> copyWith({
    int? sortColumnIndex,
    bool? sortAscending,
    List<T>? list,
    bool? isLoading
  }) => DataTableDataBase<T>(
    list: list ?? this.list,
    sortColumnIndex: sortColumnIndex ?? this.sortColumnIndex,
    sortAscending: sortAscending ?? this.sortAscending,
    isLoading: isLoading ?? this.isLoading
  );
}