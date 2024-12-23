import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Person {
  final String name;
  final String surname;
  final int id;
  Person({
    required this.name,
    required this.surname,
    required this.id,
  });

  Person copyWith({
    String? name,
    String? surname,
    int? id,
  }) {
    return Person(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      id: id ?? this.id,
    );
  }

  @override
  String toString() => 'Person(name: $name, surname: $surname, id: $id)';

  static List<Person> personList() {
    return <Person>[
      Person(name: 'Fotis', surname: 'Psarris', id: 1),
      Person(name: 'Giannis', surname: 'Mixahl', id: 2),
      Person(name: 'Mixalis', surname: 'Panagiwtou', id: 3),
      Person(name: 'Kostas', surname: 'Kenzo', id: 4),
      Person(name: 'Vaggelis', surname: 'Fernandes', id: 5),
      Person(name: 'Giorgos', surname: 'Pats', id: 6),
      Person(name: 'Tasos', surname: 'Dim', id: 7),
      Person(name: 'Panos', surname: 'Vagg', id: 8),
      Person(name: 'Eleni', surname: 'Mar', id: 9),
      Person(name: 'Maria', surname: 'Kos', id: 10),
      Person(name: 'Kostis', surname: 'Mars', id: 11),
      Person(name: 'Mixalis', surname: 'Jackson', id: 12),
      Person(name: 'Fotis', surname: 'Xristopoulos', id: 13),
      Person(name: 'Aleksandros', surname: 'Sar', id: 14),
      Person(name: 'Iwshf', surname: 'Papas', id: 15),
      Person(name: 'Xrhstos', surname: 'Daskalakhs', id: 16),
      Person(name: 'Sofia', surname: 'Sar', id: 17),
      Person(name: 'Dimitra', surname: 'Mar', id: 18),
      Person(name: 'Iwanna', surname: 'Spyropoulou', id: 19),
      Person(name: 'Spyros', surname: 'Iaswnos', id: 20),
      Person(name: 'Lazaros', surname: 'Dimitriou', id: 21),
      Person(name: 'Marios', surname: 'Alv', id: 22),
      Person(name: 'Fotis', surname: 'Mougk', id: 23),
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'surname': surname,
      'id': id,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      name: map['name'] as String,
      surname: map['surname'] as String,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) =>
      Person.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Person other) {
    if (identical(this, other)) return true;

    return other.name == name && other.surname == surname && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ surname.hashCode ^ id.hashCode;
}
