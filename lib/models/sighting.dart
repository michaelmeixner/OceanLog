class Sighting {
  final String species;
  final String? location;
  final DateTime timestamp;

  Sighting({required this.species, this.location, DateTime? timestamp})
    : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'species': species,
    'location': location,
    'timestamp': timestamp.toIso8601String(),
  };

  factory Sighting.fromJson(Map<String, dynamic> json) {
    return Sighting(
      species: json['species'],
      location: json['location'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
