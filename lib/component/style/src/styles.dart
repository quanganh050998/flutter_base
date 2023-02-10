part of style;

_ThemeColor _darkThemeData = _DarkTheme();
_ThemeColor _lightThemeData = _LightTheme();

void setStyleDefault() {
  bool isDark = brightness == Brightness.dark;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    systemNavigationBarColor: isDark ? Colors.black : Colors.white,
    systemNavigationBarIconBrightness:
    isDark ? Brightness.light : Brightness.dark,
    statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
  ));
}

class _ThemeData {
  _ThemeColor color = _lightThemeData;
  _ThemeFont font = _ThemeFont();

  /// Receiver theme mode updated
  registerNotifyUpdated(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeManager>();

  _update({_ThemeColor? color, _ThemeFont? font}) {
    if (color != null) {
      this.color = color;
    }
    if (font != null) {
      this.font = font;
    }
  }
}

Brightness get brightness => ThemeManager._brightness;

_ThemeData get theme => ThemeManager._current;

/// Support change themes dark and light mode
@immutable
class ThemeManager extends InheritedWidget {
  static Brightness _brightness = Brightness.light;
  static final _ThemeData _themeData = _ThemeData();
  final int timeStamp;

  const ThemeManager({
    Key? key,
    required Widget child,
    required this.timeStamp,
  }) : super(key: key, child: child);

  static updateThemeMode(bool isDarkMode) {
    _brightness = isDarkMode ? Brightness.dark : Brightness.light;
    setStyleDefault();
    final color =
    (_brightness == Brightness.dark) ? _darkThemeData : _lightThemeData;
    _themeData._update(color: color);
  }

  static _ThemeData get _current => _themeData;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return this != oldWidget;
  }
}