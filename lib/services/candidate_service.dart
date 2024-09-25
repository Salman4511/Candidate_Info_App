import 'package:cloud_firestore/cloud_firestore.dart';

class CandidateService {
  final CollectionReference _candidateCollection =
      FirebaseFirestore.instance.collection('candidates');

  Future<void> addCandidateData({
    required String expectedJoiningDate,
    required String noticePeriod,
    required String offeredCTC,
    required String ctcBreakdown,
    required String currentInHandSalary,
    required String salaryComponents,
    required String tdsDeduction,
    required String otherDeductions,
    required String companyName,
    required String jobTitle,
    required String workExperience,
    required String relevantSkills,
    required String proficiencyTools,
    required String skillImprovement,
    required String expectedDuration,
    required String name,
    required String jobPosition,
    required String contactNumber,
    required String emailAddress,
  }) async {
    await _candidateCollection.add({
      'expectedJoiningDate': expectedJoiningDate,
      'noticePeriod': noticePeriod,
      'offeredCTC': offeredCTC,
      'ctcBreakdown': ctcBreakdown,
      'currentInHandSalary': currentInHandSalary,
      'salaryComponents': salaryComponents,
      'tdsDeduction': tdsDeduction,
      'otherDeductions': otherDeductions,
      'companyName': companyName,
      'jobTitle': jobTitle,
      'workExperience': workExperience,
      'relevantSkills': relevantSkills,
      'proficiencyTools': proficiencyTools,
      'skillImprovement': skillImprovement,
      'expectedDuration': expectedDuration,
      'name': name,
      'jobPosition': jobPosition,
      'contactNumber': contactNumber,
      'emailAddress': emailAddress,
    });
  }

  Future<List<Map<String, dynamic>>> getCandidates() async {
    QuerySnapshot snapshot = await _candidateCollection.get();
    return snapshot.docs.map((doc) {
      return {
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>,
      };
    }).toList();
  }
}
