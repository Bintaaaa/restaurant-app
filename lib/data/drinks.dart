class Drinks {
  final String name;

  Drinks({required this.name});

  List<Object> get props => [
        name,
      ];

  factory Drinks.fromJson(Map<String, dynamic> json) => Drinks(name: json['name']);
}
