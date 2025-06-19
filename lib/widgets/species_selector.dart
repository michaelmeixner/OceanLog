import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class SpeciesSelector extends StatefulWidget {
  final ValueChanged<String> onSelected;

  const SpeciesSelector({super.key, required this.onSelected});

  @override
  State<SpeciesSelector> createState() => _SpeciesSelectorState();
}

class _SpeciesSelectorState extends State<SpeciesSelector> {
  List<Map<String, dynamic>> speciesGroups = [];
  String? selectedSpecies;

  @override
  void initState() {
    super.initState();
    loadSpeciesData();
  }

  Future<void> loadSpeciesData() async {
    final String jsonString = await rootBundle.loadString(
      'assets/species_list_grouped.json',
    );
    final List<dynamic> jsonData = json.decode(jsonString);

    setState(() {
      speciesGroups = jsonData.cast<Map<String, dynamic>>();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (speciesGroups.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: speciesGroups.map((group) {
        final String groupName = group['type'];
        final List<dynamic> speciesList = group['species'];

        return ExpansionTile(
          title: Text(
            groupName,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: speciesList.map<Widget>((species) {
                  final String name = species['name'];
                  final String icon = species['icon'];
                  final bool isSelected = name == selectedSpecies;

                  return ChoiceChip(
                    label: Text('$icon $name'),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() {
                        selectedSpecies = name;
                      });
                      widget.onSelected(name);
                    },
                    selectedColor: Colors.blue.shade200,
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      }).toList(),
    );
  }
}
