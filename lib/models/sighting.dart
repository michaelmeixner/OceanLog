class Sighting {
  final List<String> species;
  final DateTime timestamp;
  final String? locationName;
  final double? latitude;
  final double? longitude;
  final double? depth;
  final double? waterTemp;
  final String? visibility;
  final String? behavior;
  final String? notes;

  Sighting({
    required this.species,
    DateTime? timestamp,
    this.locationName,
    this.latitude,
    this.longitude,
    this.depth,
    this.waterTemp,
    this.visibility,
    this.behavior,
    this.notes,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'species': species.join(','),
    'timestamp': timestamp.toIso8601String(),
    'locationName': locationName,
    'latitude': latitude,
    'longitude': longitude,
    'depth': depth,
    'waterTemp': waterTemp,
    'visibility': visibility,
    'behavior': behavior,
    'notes': notes,
  };

  factory Sighting.fromJson(Map<String, dynamic> json) => Sighting(
    species: (json['species'] as String).split(','),
    timestamp: DateTime.parse(json['timestamp']),
    locationName: json['locationName'],
    latitude: json['latitude'],
    longitude: json['longitude'],
    depth: (json['depth'] as num?)?.toDouble(),
    waterTemp: (json['waterTemp'] as num?)?.toDouble(),
    visibility: json['visibility'],
    behavior: json['behavior'],
    notes: json['notes'],
  );
}
