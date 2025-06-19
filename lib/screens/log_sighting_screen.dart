import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../widgets/species_selector.dart';

class LogSightingScreen extends StatefulWidget {
  const LogSightingScreen({super.key});

  @override
  State<LogSightingScreen> createState() => _LogSightingScreenState();
}

class _LogSightingScreenState extends State<LogSightingScreen> {
  String? selectedSpecies;
  String? locationName;
  double? latitude;
  double? longitude;
  double? depth;
  double? waterTemp;
  String? visibility;
  String? behavior;
  String? notes;

  final _depthController = TextEditingController();
  final _tempController = TextEditingController();
  final _notesController = TextEditingController();

  final List<String> visibilityOptions = ['Poor', 'Fair', 'Good', 'Excellent'];
  final List<String> behaviorOptions = [
    'Feeding',
    'Resting',
    'Passing',
    'Breaching',
    'Other',
  ];

  final _locationController = TextEditingController();

  void handleSpeciesSelected(String species) {
    setState(() {
      selectedSpecies = species;
    });
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location services are disabled.')),
      );
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Location permissions are permanently denied.'),
        ),
      );
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });
  }

  @override
  void dispose() {
    _depthController.dispose();
    _tempController.dispose();
    _notesController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Log New Sighting')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpeciesSelector(onSelected: handleSpeciesSelected),
            const SizedBox(height: 16),

            if (selectedSpecies != null)
              Text(
                'Selected: $selectedSpecies',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 24),

            const Text('Enter site name (optional):'),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(
                hintText: 'e.g. Blue Hole, Belize',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  locationName = value;
                });
              },
            ),

            const SizedBox(height: 16),

            ElevatedButton.icon(
              onPressed: _getCurrentLocation,
              icon: const Icon(Icons.my_location),
              label: const Text('Use Current GPS Location'),
            ),

            const SizedBox(height: 24),
            Text('Depth (m):'),
            TextField(
              controller: _depthController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'e.g. 12.5',
              ),
              onChanged: (value) {
                setState(() {
                  depth = double.tryParse(value);
                });
              },
            ),

            const SizedBox(height: 16),
            Text('Water Temperature (°C):'),
            TextField(
              controller: _tempController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'e.g. 24.7',
              ),
              onChanged: (value) {
                setState(() {
                  waterTemp = double.tryParse(value);
                });
              },
            ),

            const SizedBox(height: 16),
            Text('Visibility:'),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              value: visibility,
              hint: const Text('Select visibility'),
              items: visibilityOptions.map((vis) {
                return DropdownMenuItem<String>(value: vis, child: Text(vis));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  visibility = value;
                });
              },
            ),

            const SizedBox(height: 16),
            Text('Behavior:'),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              value: behavior,
              hint: const Text('Select behavior'),
              items: behaviorOptions.map((b) {
                return DropdownMenuItem<String>(value: b, child: Text(b));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  behavior = value;
                });
              },
            ),

            const SizedBox(height: 16),
            Text('Notes:'),
            TextField(
              controller: _notesController,
              maxLines: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Any other observations...',
              ),
              onChanged: (value) {
                setState(() {
                  notes = value;
                });
              },
            ),

            if (latitude != null && longitude != null)
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text('📍 Coordinates: $latitude, $longitude'),
              ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                // Save logic here (mock)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Saved sighting at $latitude, $longitude'),
                  ),
                );
              },
              child: const Text('Save Sighting'),
            ),
          ],
        ),
      ),
    );
  }
}
