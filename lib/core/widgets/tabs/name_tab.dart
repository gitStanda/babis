import 'package:babisappka/core/functions/load_data.dart';
import 'package:diacritic/diacritic.dart';

import 'package:flutter/material.dart';

class NameTab extends StatefulWidget {
  const NameTab({super.key});

  @override
  State<NameTab> createState() => _NameTabState();
}

class _NameTabState extends State<NameTab> {
  TextEditingController controller = TextEditingController();
  final List<FirmaData> _searchResult = [];
  final List<FirmaData> _babisCompanies = [];

  Future<void> getBabisCompanies() async {
    if (_babisCompanies.isEmpty) {
      final companies = await loadAgro();
      // remove duplicates
      _babisCompanies.addAll(
        companies.where(
          (company) => !_babisCompanies.any((existingCompany) => existingCompany.nazev == company.nazev),
        ),
      );
      _searchResult.addAll(_babisCompanies); // Populate _searchResult with all companies
      setState(() {});
    }
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();

    if (text.isEmpty) {
      _searchResult.addAll(_babisCompanies); // Show all companies when search is empty
      setState(() {});
      return;
    }

    text = text.toLowerCase(); // Convert text to lowercase
    final normalizedText = removeDiacritics(text); // Remove diacritics

    for (var babisCompany in _babisCompanies) {
      final normalizedCompany = removeDiacritics(babisCompany.nazev.toLowerCase());
      if (normalizedCompany.contains(normalizedText)) {
        _searchResult.add(babisCompany);
      }
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    getBabisCompanies();
  }

  // Modify your build method like this
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(6),
          child: Text(
              "Tohle je seznam všech výrobců spadajících pod Agrofert. Pokud zde výrobce najdete, tak mám špatnou zprávu."),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            child: ListTile(
              leading: const Icon(Icons.search),
              title: TextField(
                controller: controller,
                decoration: const InputDecoration(hintText: 'Napiš jméno výrobce', border: InputBorder.none),
                onChanged: onSearchTextChanged,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  controller.clear();
                  onSearchTextChanged('');
                },
              ),
            ),
          ),
        ),
        // Inside your build method
        Expanded(
          child: ListView.builder(
            itemCount: _searchResult.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    _searchResult[index].nazev,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
