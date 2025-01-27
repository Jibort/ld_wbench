// Eines per a ajudar a la gestió dels valors nulls.
// createdAt: 24/10/17 dj. JIQ

// Retorna cert només si 'pInst' NO ÉS nul.
bool isNotNull(dynamic pInst) {
  return !isNull(pInst);
}

// Retorna cert només si 'pInst' ÉS nul.
bool isNull(dynamic pInst) {
  if (pInst == null) return true;

  switch (pInst) {
    case String str:
      return str.trim().isEmpty;
    // case UserType usrType:
    //   return usrType == UserType.unspecified;
    // case UserState usrState:
    //   return usrState == UserState.unspecified;
    // case DeviceType devType:
    //   return devType == DeviceType.unspecified;
    // case DeviceState devState:
    //   return devState == DeviceState.unspecified;
    // case ResourceType resType:
    //   return resType == ResourceType.unspecified;
    // case TrackingColumnType trkColType:
    //   return trkColType == TrackingColumnType.unspecified;
    // case QuestionType qstType:
    //   return qstType == QuestionType.unspecified;
    // case AchievementState achState:
    //   return achState == AchievementState.unspecified;
    // case DiagnosisPhaseState diagState:
    //   return diagState == DiagnosisPhaseState.unspecified;
    // case DiagnosisState diagState:
    //   return diagState == DiagnosisState.unspecified;
    // case RegisterState regState:
    //   return regState == RegisterState.unspecified;
    // case NotificationType notifType:
    //   return notifType == NotificationType.unspecified;
    // case NotificationState notifState:
    //   return notifState == NotificationState.unspecified;
    // case TaskType taskType:
    //   return taskType == TaskType.unspecified;
    // case TaskState taskState:
    //   return taskState == TaskState.unspecified;
    // case VisitType visitType:
    //   return visitType == VisitType.unspecified;
    // case VisitState visitState:
    //   return visitState == VisitState.unspecified;
    default:
      return false;
  }
}

