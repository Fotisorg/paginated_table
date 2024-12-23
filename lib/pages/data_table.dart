import 'package:flutter/material.dart';
import 'package:paginated_data_table_example/models/list.dart';
import 'package:paginated_data_table_example/services/api.dart';

class PaginatedTable extends StatefulWidget {
  const PaginatedTable({super.key});

  @override
  State<PaginatedTable> createState() => _PaginatedTableState();
}

class _PaginatedTableState extends State<PaginatedTable> {
  late PersonDataTableSource _data;
  bool _isAscending = true;
  int _sortColumnIndex = 0;

  @override
  void initState() {
    super.initState();
    // Api().getP();
    _data = PersonDataTableSource(Person.personList());
  }

  void _sort(Comparable Function(Person person) getField, int columnIndex,
      bool ascending) {
    _data.sort(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _isAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        header: const Text('Person List'),
        rowsPerPage: 10,
        sortColumnIndex: _sortColumnIndex,
        sortAscending: _isAscending,
        columns: [
          DataColumn(
            label: const Text('ID'),
            onSort: (index, ascending) => _sort((p) => p.id, index, ascending),
          ),
          DataColumn(
            label: const Text('Name'),
            onSort: (index, ascending) =>
                _sort((p) => p.name, index, ascending),
          ),
          DataColumn(
            label: const Text('Surname'),
            onSort: (index, ascending) =>
                _sort((p) => p.surname, index, ascending),
          ),
        ],
        source: _data,
      ),
    );
  }
}

class PersonDataTableSource extends DataTableSource {
  final List<Person> _persons;
  PersonDataTableSource(this._persons);

  void sort(Comparable Function(Person person) getField, bool ascending) {
    _persons.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  @override
  DataRow? getRow(int index) {
    if (index >= _persons.length) return null;
    final person = _persons[index];
    return DataRow(cells: [
      DataCell(Text(person.id.toString())),
      DataCell(Text(person.name)),
      DataCell(Text(person.surname)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _persons.length;

  @override
  int get selectedRowCount => 0;
}
