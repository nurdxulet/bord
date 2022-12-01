import 'package:bord/models/organization.dart';

class Promotion {
  Organization organization;
  String promotionTitle;
  String promotionDescription;
  DateTime promotionStartDate;
  DateTime promotionEndDate;

  Promotion(
      {required this.organization,
      required this.promotionDescription,
      required this.promotionTitle,
      required this.promotionStartDate,
      required this.promotionEndDate});
}
