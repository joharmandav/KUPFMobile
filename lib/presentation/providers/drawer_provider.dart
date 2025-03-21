

class Singleton {
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}

enum DrawerState {
  home,
  profile,
  service,
  specialService,
  settings,
  onlineForm,
  logout,
}
