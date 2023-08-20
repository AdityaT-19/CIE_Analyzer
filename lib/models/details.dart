enum Event { E1, E2, E3, E4, E5 }

enum Grades { S, A, B, C, D, E, F }

class Subject {
  Subject(this.subCode) : subTitle = '20CS${subCode}0';
  Subject.math(this.subCode) : subTitle = '20MA${subCode}12';
  final int subCode;
  final String subTitle;
  Map<Event, int> marks = {};
  int cie = 0;
  void calCie() {
    for (var mark in marks.values) {
      cie += mark;
    }
    cie = cie ~/ 2 + cie.remainder(2);
  }

  String get cieMess {
    calCie();
    return 'Your CIE is $cie';
  }

  String reqSeeMes(Grades c) {
    int tot = 50 + cie;
    int? reqSee;
    bool valid;
    switch (c) {
      case Grades.S:
        if (tot >= 90) {
          valid = true;
          reqSee = (90 - cie) * 2;
        } else {
          valid = false;
        }
      case Grades.A:
        if (tot >= 75) {
          valid = true;
          reqSee = (75 - cie) * 2;
        } else {
          valid = false;
        }
      case Grades.B:
        if (tot >= 66) {
          valid = true;
          reqSee = (66 - cie) * 2;
        } else {
          valid = false;
        }
      case Grades.C:
        if (tot >= 56) {
          valid = true;
          reqSee = (56 - cie) * 2;
        } else {
          valid = false;
        }
      case Grades.D:
        if (tot >= 50) {
          valid = true;
          reqSee = (50 - cie) * 2;
        } else {
          valid = false;
        }
        break;
      case Grades.E:
        if (tot >= 45) {
          valid = true;
          reqSee = (45 - cie) * 2;
        } else {
          valid = false;
        }
        break;
      default:
        valid = false;
    }
    if (valid == true) {
      if (reqSee! < 40) {
        reqSee = 40;
      }
      return 'You need $reqSee in SEE';
    } else {
      return "You Can't get this Grade";
    }
  }
}
