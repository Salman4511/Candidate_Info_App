import 'package:flutter/material.dart';
import 'package:form_app/widgets/details_row_widget.dart';

class CandidateDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> candidate;

  const CandidateDetailsScreen({super.key, required this.candidate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(candidate['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDetailRow(
                  'Expected Joining Date', candidate['expectedJoiningDate']),
              buildDetailRow('Notice Period', candidate['noticePeriod']),
              buildDetailRow('Offered CTC', candidate['offeredCTC']),
              buildDetailRow('CTC Breakdown', candidate['ctcBreakdown']),
              buildDetailRow(
                  'Current In-hand Salary', candidate['currentInHandSalary']),
              buildDetailRow('Salary Components', candidate['salaryComponents']),
              buildDetailRow('TDS Deduction', candidate['tdsDeduction']),
              buildDetailRow('Other Deductions', candidate['otherDeductions']),
              buildDetailRow(
                  'Current/Last Company Name', candidate['companyName']),
              buildDetailRow('Job Title', candidate['jobTitle']),
              buildDetailRow(
                  'Total Work Experience', candidate['workExperience']),
              buildDetailRow('Relevant Skills', candidate['relevantSkills']),
              buildDetailRow(
                  'Proficiency in Tools', candidate['proficiencyTools']),
              buildDetailRow(
                  'Areas for Improvement', candidate['skillImprovement']),
              buildDetailRow('Expected Duration', candidate['expectedDuration']),
              buildDetailRow('Job Position', candidate['jobPosition']),
              buildDetailRow('Contact Number', candidate['contactNumber']),
              buildDetailRow('Email Address', candidate['emailAddress']),
            ],
          ),
        ),
      ),
    );
  }

}
