class SessionManager {
  static final SessionManager _instance = SessionManager._internal();

  factory SessionManager() => _instance;

  SessionManager._internal();

  String? _token; // التوكين يبقى في الذاكرة فقط

  // حفظ التوكين
  void saveToken(String token) {
    _token = token;
  }

  // استرجاع التوكين
  String? getToken() {
    return _token;
  }

  // حذف التوكين
  void deleteToken() {
    _token = null;
  }

  // هذا يمكن تسميته عند إغلاق التطبيق
  void clearSession() {
    _token = null;
  }
  
}
