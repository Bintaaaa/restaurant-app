class Foods {
  final String name;

  Foods({required this.name});

  List<Object> get props =>[
    name
  ];

  factory Foods.fromJson(Map<String, dynamic> json ) => Foods(name: json['name']);
}
