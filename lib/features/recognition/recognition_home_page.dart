import 'package:flutter/material.dart';

import 'models/recognition_models.dart';
import 'widgets/recognition_widgets.dart';

class RecognitionHomePage extends StatefulWidget {
  const RecognitionHomePage({super.key});

  @override
  State<RecognitionHomePage> createState() => _RecognitionHomePageState();
}

class _RecognitionHomePageState extends State<RecognitionHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  RecognitionMode _selectedMode = RecognitionMode.object;
  AppLanguage _selectedLanguage = AppLanguage.vietnamese;
  ThemeMode _themeMode = ThemeMode.dark;

  int get _currentBottomIndex => bottomModes.indexOf(_selectedMode);

  void _selectMode(RecognitionMode mode) {
    setState(() {
      _selectedMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(
        selectedMode: _selectedMode,
        selectedLanguage: _selectedLanguage,
        themeMode: _themeMode,
        onModeSelected: (mode) {
          Navigator.of(context).pop();
          _selectMode(mode);
        },
        onLanguageSelected: (language) {
          setState(() {
            _selectedLanguage = language;
          });
        },
        onThemeModeChanged: (themeMode) {
          setState(() {
            _themeMode = themeMode;
          });
        },
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Color(0xFF101C22),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 24,
                    offset: Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  TopBar(
                    title: _selectedMode.title,
                    onMenuPressed: () =>
                        _scaffoldKey.currentState?.openDrawer(),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.white.withValues(alpha: 0.06),
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 14),
                    child: Text(
                      _selectedMode.subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(child: CameraPreview(mode: _selectedMode)),
                  ActionControls(mode: _selectedMode),
                  BottomNavigation(
                    selectedIndex: _currentBottomIndex,
                    modes: bottomModes,
                    onSelected: (index) => _selectMode(bottomModes[index]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
