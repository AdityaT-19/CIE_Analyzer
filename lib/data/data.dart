import 'package:cie_final/models/details.dart';

enum SubTitle {
  S1,
  S2,
  S3,
  S4,
  S5,
  S6,
}

class MarksDestails {
  final Map<SubTitle, Subject> data = {
    SubTitle.S1: Subject(41),
    SubTitle.S2: Subject(42),
    SubTitle.S3: Subject(43),
    SubTitle.S4: Subject(44),
    SubTitle.S5: Subject(45),
    SubTitle.S6: Subject.math(4)
  };
}
