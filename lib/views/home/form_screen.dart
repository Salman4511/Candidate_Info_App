import 'package:flutter/material.dart';
import 'package:form_app/controllers/auth_controller.dart';
import 'package:form_app/services/candidate_service.dart';
import 'package:form_app/utils/constants.dart';
import 'package:form_app/widgets/form_text_field_widget.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final CandidateService candidateService = CandidateService();

    final TextEditingController expectedJoiningDateController =
        TextEditingController();
    final TextEditingController noticePeriodController =
        TextEditingController();
    final TextEditingController offeredCTCController = TextEditingController();
    final TextEditingController ctcBreakdownController =
        TextEditingController();
    final TextEditingController currentInHandSalaryController =
        TextEditingController();
    final TextEditingController salaryComponentsController =
        TextEditingController();
    final TextEditingController tdsDeductionController =
        TextEditingController();
    final TextEditingController otherDeductionsController =
        TextEditingController();
    final TextEditingController companyNameController = TextEditingController();
    final TextEditingController jobTitleController = TextEditingController();
    final TextEditingController workExperienceController =
        TextEditingController();
    final TextEditingController relevantSkillsController =
        TextEditingController();
    final TextEditingController proficiencyToolsController =
        TextEditingController();
    final TextEditingController skillImprovementController =
        TextEditingController();
    final TextEditingController expectedDurationController =
        TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController jobPositionController = TextEditingController();
    final TextEditingController contactNumberController =
        TextEditingController();
    final TextEditingController emailAddressController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post-Interview Candidate Info'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthController>().logout();
              Navigator.pushNamed(context, '/landing');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextField(
                    'Expected Date of Joining', expectedJoiningDateController),
                    kHeight10,
                buildTextField(
                    'Notice Period (if applicable)', noticePeriodController),
                    kHeight10,
                buildTextField('Offered CTC', offeredCTCController),
                kHeight10,
                buildTextField('CTC Breakdown (Basic, Allowances, etc.)',
                
                    ctcBreakdownController),
                    kHeight10,
                buildTextField(
                    'Current In-hand Salary', currentInHandSalaryController),
                    kHeight10,
                buildTextField('Salary Components (e.g., HRA, PF)',
                    salaryComponentsController),
                    kHeight10,
                buildTextField('Current TDS Deduction (per month)',
                    tdsDeductionController),
                    kHeight10,
                buildTextField(
                    'Other Deductions (if any)', otherDeductionsController),
                    kHeight10,
                buildTextField(
                    'Current/Last Company Name', companyNameController),
                    kHeight10,
                buildTextField('Current Job Title', jobTitleController),
                kHeight10,
                buildTextField(
                    'Total Work Experience', workExperienceController),
                    kHeight10,
                buildTextField('Relevant Skills', relevantSkillsController),
                kHeight10,
                buildTextField('Proficiency in Required Tools/Software',
                    proficiencyToolsController),
                    kHeight10,
                buildTextField('Areas for Skill Improvement (if any)',
                    skillImprovementController),
                    kHeight10,
                buildTextField(
                    'Expected Duration', expectedDurationController),
                    kHeight10,
                buildTextField('Name', nameController),
                kHeight10,
                buildTextField('Job Position', jobPositionController),
                kHeight10,
                buildTextField('Contact Number', contactNumberController),
                kHeight10,
                buildTextField('Email Address', emailAddressController),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        candidateService.addCandidateData(
                          expectedJoiningDate:
                               expectedJoiningDateController.text.toString(),
                          noticePeriod: noticePeriodController.text.toString(),
                          offeredCTC: offeredCTCController.text.toString(),
                          ctcBreakdown: ctcBreakdownController.text.toString(),
                          currentInHandSalary:
                              currentInHandSalaryController.text.toString(),
                          salaryComponents: salaryComponentsController.text.toString(),
                          tdsDeduction: tdsDeductionController.text.toString(),
                          otherDeductions: otherDeductionsController.text.toString(),
                          companyName: companyNameController.text.toString(),
                          jobTitle: jobTitleController.text.toString(),
                          workExperience: workExperienceController.text.toString(),
                          relevantSkills: relevantSkillsController.text.toString(),
                          proficiencyTools: proficiencyToolsController.text.toString(),
                          skillImprovement: skillImprovementController.text.toString(),
                          expectedDuration: expectedDurationController.text.toString(),
                          name: nameController.text.toString(),
                          jobPosition: jobPositionController.text.toString(),
                          contactNumber: contactNumberController.text.toString(),
                          emailAddress: emailAddressController.text.toString(),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Form Submitted')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 
}
