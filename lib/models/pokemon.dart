class Pokemon {
  final String message;
  final String status;

  Pokemon({required this.message, required this.status});

  factory Pokemon.fromJson(Map<String, dynamic> json){
    return Pokemon(
      message: json['message'],
      status: json['status'],
    );
  }
}