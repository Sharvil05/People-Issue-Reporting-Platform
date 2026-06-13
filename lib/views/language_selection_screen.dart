import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/language_controller.dart';
import '../routes/app_routes.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageController = Provider.of<LanguageController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose your preferred language',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: languageController.languages.length,
                itemBuilder: (context, index) {
                  final language = languageController.languages[index];
                  final isSelected = languageController.selectedLanguageCode == language.code;

                  return Card(
                    color: isSelected ? Theme.of(context).primaryColor.withOpacity(0.1) : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: isSelected ? Theme.of(context).primaryColor : Colors.grey[300]!,
                        width: 2,
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      title: Text(
                        language.name,
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      trailing: isSelected
                          ? Icon(Icons.check_circle, color: Theme.of(context).primaryColor)
                          : null,
                      onTap: () {
                        languageController.setLanguage(language.code);
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.login);
                },
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
