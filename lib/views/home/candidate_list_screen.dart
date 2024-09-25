import 'package:flutter/material.dart';
import 'package:form_app/services/candidate_service.dart';
import 'candidate_details_screen.dart';

class CandidateListScreen extends StatelessWidget {
  final CandidateService _candidateService = CandidateService();

  CandidateListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candidate List'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _candidateService.getCandidates(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching candidates.'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No candidates found.'));
          }

          final candidates = snapshot.data!;
          return ListView.builder(
            itemCount: candidates.length,
            itemBuilder: (context, index) {
              final candidate = candidates[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(candidate['name']),
                  subtitle: Text('Job Position: ${candidate['jobPosition']}'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CandidateDetailsScreen(candidate: candidate),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
