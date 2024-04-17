enum ResetPasswordResponse {
  ok,
  networkRequestFailed,
  userDisabled,
  userNotFound,
  tooManyRequests,
  unknown
}

ResetPasswordResponse stringToResetPasswordResponse(String code) {
  switch (code) {
    case 'network-request-failed':
      return ResetPasswordResponse.networkRequestFailed;
    case 'user-disabled':
      return ResetPasswordResponse.userDisabled;
    case 'user-not-found':
      return ResetPasswordResponse.userNotFound;
    case 'too-many-requests':
      return ResetPasswordResponse.tooManyRequests;
    case 'unknown':
      return ResetPasswordResponse.unknown;
    default:
      return ResetPasswordResponse.networkRequestFailed;
  }
}
