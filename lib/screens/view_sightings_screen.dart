import 'package:flutter/material.dart';
import 'package:oceanlog/database/sighting_database.dart';
import 'package:oceanlog/models/sighting.dart';

class ViewSightingsScreen extends StatefulWidget {
  const ViewSightingsScreen({Key? key}) : super(key: key);

  @override
  State<ViewSightingsScreen> createState() => _ViewSightingsScreenState();
}

class _ViewSightingsScreenState extends State<ViewSightingsScreen> {
  late Future<List<Sighting>> _sightingsFuture;

  @override
  void initState() {
    super.initState();
    _sightingsFuture = SightingDatabase.instance.getAllSightings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('View Sightings')),
      body: FutureBuilder<List<Sighting>>(
        future: _sightingsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No sightings found.'));
          } else {
            final sightings = snapshot.data!;
            return ListView.builder(
              itemCount: sightings.length,
              itemBuilder: (context, index) {
                final sighting = sightings[index];
                return ListTile(
                  title: Text(sighting.species.join(', ')),
                  subtitle: Text(
                    '${sighting.timestamp.toLocal()}\n${sighting.locationName ?? "No location"}',
                  ),
                  isThreeLine: true,
                );
              },
            );
          }
        },
      ),
    );
  }
}
