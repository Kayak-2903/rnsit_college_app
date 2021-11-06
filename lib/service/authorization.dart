class Authorization {
  checkAuthorization(String loginType, String username, String password) async {
    await Future.delayed(const Duration(seconds: 5));
    return true;
  }
}
