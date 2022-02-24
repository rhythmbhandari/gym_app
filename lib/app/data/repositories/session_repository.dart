class SessionRepository {
  SessionRepository._privateConstructor();

  static final SessionRepository _instance = SessionRepository._privateConstructor();

  static SessionRepository get instance => _instance;

  String _accessToken;
  String get accessToken => _accessToken;
  void setAccessToken(String accessToken) => _accessToken = accessToken;

}