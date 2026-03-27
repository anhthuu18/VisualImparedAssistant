import 'package:flutter/material.dart';

import '../models/recognition_models.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.title, required this.onMenuPressed});

  final String title;
  final VoidCallback onMenuPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: onMenuPressed,
            icon: const Icon(Icons.menu_rounded, size: 32),
            splashRadius: 24,
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          const CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFF233740),
            child: Icon(Icons.person_rounded, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class CameraPreview extends StatelessWidget {
  const CameraPreview({super.key, required this.mode});

  final RecognitionMode mode;

  @override
  Widget build(BuildContext context) {
    final Size frameSize = mode.frameSize;

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xFF15232A),
                Color(0xFF101C22),
                Color(0xFF22353F),
              ],
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.black.withValues(alpha: 0.36),
                Colors.transparent,
                Colors.transparent,
                Colors.black.withValues(alpha: 0.46),
              ],
              stops: const <double>[0, 0.22, 0.74, 1],
            ),
          ),
        ),
        Center(
          child: DetectionFrame(mode: mode, size: frameSize),
        ),
        Positioned(
          left: 24,
          right: 24,
          bottom: 28,
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 320),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF13A4EC),
                borderRadius: BorderRadius.circular(999),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Color(0x5513A4EC),
                    blurRadius: 18,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(Icons.info_rounded, size: 20, color: Colors.white),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      mode.statusText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DetectionFrame extends StatelessWidget {
  const DetectionFrame({super.key, required this.mode, required this.size});

  final RecognitionMode mode;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = BorderRadius.circular(
      mode.circularFrame ? 999 : 24,
    );

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: radius,
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.18),
                width: 2,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(mode.icon, size: 64, color: const Color(0x4D13A4EC)),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      mode.scanLabel.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 11,
                        letterSpacing: 2.4,
                        fontWeight: FontWeight.w700,
                        color: Color(0x9913A4EC),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          FrameCorner(
            alignment: Alignment.topLeft,
            circular: mode.circularFrame,
          ),
          FrameCorner(
            alignment: Alignment.topRight,
            circular: mode.circularFrame,
          ),
          FrameCorner(
            alignment: Alignment.bottomLeft,
            circular: mode.circularFrame,
          ),
          FrameCorner(
            alignment: Alignment.bottomRight,
            circular: mode.circularFrame,
          ),
        ],
      ),
    );
  }
}

class FrameCorner extends StatelessWidget {
  const FrameCorner({
    super.key,
    required this.alignment,
    required this.circular,
  });

  final Alignment alignment;
  final bool circular;

  @override
  Widget build(BuildContext context) {
    final bool isTop = alignment.y < 0;
    final bool isLeft = alignment.x < 0;
    final double size = circular ? 52 : 42;
    final Radius radius = Radius.circular(circular ? 40 : 16);

    return Align(
      alignment: alignment,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border(
            top: isTop
                ? const BorderSide(color: Color(0xFF13A4EC), width: 4)
                : BorderSide.none,
            left: isLeft
                ? const BorderSide(color: Color(0xFF13A4EC), width: 4)
                : BorderSide.none,
            right: !isLeft
                ? const BorderSide(color: Color(0xFF13A4EC), width: 4)
                : BorderSide.none,
            bottom: !isTop
                ? const BorderSide(color: Color(0xFF13A4EC), width: 4)
                : BorderSide.none,
          ),
          borderRadius: BorderRadius.only(
            topLeft: isTop && isLeft ? radius : Radius.zero,
            topRight: isTop && !isLeft ? radius : Radius.zero,
            bottomLeft: !isTop && isLeft ? radius : Radius.zero,
            bottomRight: !isTop && !isLeft ? radius : Radius.zero,
          ),
        ),
      ),
    );
  }
}

class ActionControls extends StatelessWidget {
  const ActionControls({super.key, required this.mode});

  final RecognitionMode mode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF101C22),
      padding: const EdgeInsets.fromLTRB(18, 22, 18, 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const SideActionButton(icon: Icons.image_rounded, label: 'Thư viện'),
          PrimaryActionButton(icon: mode.actionIcon),
          const SideActionButton(
            icon: Icons.flashlight_on_rounded,
            label: 'Đèn pin',
          ),
        ],
      ),
    );
  }
}

class SideActionButton extends StatelessWidget {
  const SideActionButton({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 86,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.10),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 26),
          ),
          const SizedBox(height: 8),
          Text(
            label.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.1,
              color: Color(0x99FFFFFF),
            ),
          ),
        ],
      ),
    );
  }
}

class PrimaryActionButton extends StatelessWidget {
  const PrimaryActionButton({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 88,
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.fromBorderSide(
            BorderSide(color: Color(0xFF101C22), width: 4),
          ),
        ),
        child: Icon(icon, color: const Color(0xFF101C22), size: 42),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.modes,
    required this.onSelected,
  });

  final int selectedIndex;
  final List<RecognitionMode> modes;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF13262F),
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.10)),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 24),
      child: Row(
        children: List<Widget>.generate(modes.length, (int index) {
          final RecognitionMode mode = modes[index];
          final bool selected = index == selectedIndex;

          return Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => onSelected(index),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      mode.icon,
                      size: 26,
                      color: selected
                          ? const Color(0xFF13A4EC)
                          : const Color(0xFF92B7C9),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      mode.actionLabel,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: selected
                            ? FontWeight.w700
                            : FontWeight.w500,
                        color: selected
                            ? const Color(0xFF13A4EC)
                            : const Color(0xFF92B7C9),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: selected
                            ? const Color(0xFF13A4EC)
                            : Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.selectedMode,
    required this.selectedLanguage,
    required this.onModeSelected,
    required this.onLanguageSelected,
    this.themeMode = ThemeMode.dark,
    this.onThemeModeChanged,
  });

  final RecognitionMode selectedMode;
  final AppLanguage selectedLanguage;
  final ValueChanged<RecognitionMode> onModeSelected;
  final ValueChanged<AppLanguage> onLanguageSelected;
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode>? onThemeModeChanged;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 340,
      backgroundColor: const Color(0xFF1A2A32),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 16, 16),
                      child: Row(
                        children: <Widget>[
                          const CircleAvatar(
                            radius: 22,
                            backgroundColor: Color(0xFF30434B),
                            child: Icon(
                              Icons.person_rounded,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 14),
                          const Expanded(
                            child: Text(
                              'Menu',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(Icons.close_rounded, size: 30),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.white.withValues(alpha: 0.08),
                      height: 1,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 18, 20, 10),
                      child: Text(
                        'CHẾ ĐỘ NHẬN DIỆN',
                        style: TextStyle(
                          color: Color(0xFF13A4EC),
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2.1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: drawerModes.map((RecognitionMode mode) {
                          final bool selected = mode == selectedMode;

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Material(
                              color: selected
                                  ? const Color(0x1A13A4EC)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(18),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(18),
                                onTap: () => onModeSelected(mode),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    border: selected
                                        ? Border.all(
                                            color: const Color(0x3313A4EC),
                                          )
                                        : null,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        mode.icon,
                                        size: 28,
                                        color: selected
                                            ? const Color(0xFF13A4EC)
                                            : Colors.white70,
                                      ),
                                      const SizedBox(width: 14),
                                      Text(
                                        mode.actionLabel,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: selected
                                              ? FontWeight.w700
                                              : FontWeight.w500,
                                          color: selected
                                              ? const Color(0xFF13A4EC)
                                              : Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 18, 20, 18),
                      height: 1,
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 12),
                      child: Text(
                        'NGÔN NGỮ',
                        style: TextStyle(
                          color: Color(0xFF13A4EC),
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2.1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: AppLanguage.values.map((
                          AppLanguage language,
                        ) {
                          final bool selected = language == selectedLanguage;

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () => onLanguageSelected(language),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                                decoration: BoxDecoration(
                                  color: selected
                                      ? const Color(0xFF13A4EC)
                                      : Colors.white.withValues(alpha: 0.05),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: selected
                                        ? const Color(0xFF13A4EC)
                                        : Colors.white.withValues(alpha: 0.08),
                                    width: 2,
                                  ),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withValues(
                                          alpha: selected ? 0.10 : 0.16,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        language.leading,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: Text(
                                        language.label,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      selected
                                          ? Icons.check_circle_rounded
                                          : Icons
                                                .radio_button_unchecked_rounded,
                                      color: selected
                                          ? Colors.white
                                          : Colors.white24,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 18, 20, 18),
                      height: 1,
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 12),
                      child: Text(
                        'CHỈ ĐỘ ÁNH SÁNG',
                        style: TextStyle(
                          color: Color(0xFF13A4EC),
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2.1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(14),
                              onTap: () =>
                                  onThemeModeChanged?.call(ThemeMode.light),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: themeMode == ThemeMode.light
                                      ? const Color(0xFF13A4EC)
                                      : Colors.white.withValues(alpha: 0.05),
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                    color: themeMode == ThemeMode.light
                                        ? const Color(0xFF13A4EC)
                                        : Colors.white.withValues(alpha: 0.08),
                                    width: 2,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.light_mode_rounded,
                                      color: themeMode == ThemeMode.light
                                          ? Colors.black
                                          : Colors.white70,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Sáng',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: themeMode == ThemeMode.light
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(14),
                              onTap: () =>
                                  onThemeModeChanged?.call(ThemeMode.dark),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: themeMode == ThemeMode.dark
                                      ? const Color(0xFF13A4EC)
                                      : Colors.white.withValues(alpha: 0.05),
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                    color: themeMode == ThemeMode.dark
                                        ? const Color(0xFF13A4EC)
                                        : Colors.white.withValues(alpha: 0.08),
                                    width: 2,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.dark_mode_rounded,
                                      color: themeMode == ThemeMode.dark
                                          ? Colors.black
                                          : Colors.white70,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Tối',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: themeMode == ThemeMode.dark
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.black.withValues(alpha: 0.18),
              padding: const EdgeInsets.all(20),
              child: const Row(
                children: <Widget>[
                  Icon(Icons.settings_rounded, color: Colors.white54),
                  SizedBox(width: 12),
                  Text(
                    'Cài đặt hệ thống',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
