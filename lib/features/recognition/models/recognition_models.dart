import 'package:flutter/material.dart';

enum RecognitionMode { object, text, currency, brand }

enum AppLanguage { vietnamese, english }

const List<RecognitionMode> drawerModes = <RecognitionMode>[
  RecognitionMode.text,
  RecognitionMode.currency,
  RecognitionMode.brand,
  RecognitionMode.object,
];

const List<RecognitionMode> bottomModes = <RecognitionMode>[
  RecognitionMode.object,
  RecognitionMode.text,
  RecognitionMode.currency,
  RecognitionMode.brand,
];

extension RecognitionModeX on RecognitionMode {
  String get title {
    switch (this) {
      case RecognitionMode.object:
        return 'Nhận diện vật thể';
      case RecognitionMode.text:
        return 'Nhận diện văn bản';
      case RecognitionMode.currency:
        return 'Nhận diện tiền tệ';
      case RecognitionMode.brand:
        return 'Nhận diện thương hiệu';
    }
  }

  String get subtitle {
    switch (this) {
      case RecognitionMode.object:
        return 'Hướng camera vào vật thể xung quanh';
      case RecognitionMode.text:
        return 'Hướng camera vào văn bản để đọc';
      case RecognitionMode.currency:
        return 'Hướng camera vào tờ tiền để nhận diện mệnh giá';
      case RecognitionMode.brand:
        return 'Hướng camera vào nhãn hiệu hoặc logo';
    }
  }

  String get scanLabel {
    switch (this) {
      case RecognitionMode.object:
        return 'Khu vực nhận diện';
      case RecognitionMode.text:
        return 'Đang tìm kiếm văn bản';
      case RecognitionMode.currency:
        return 'Khu vực quét';
      case RecognitionMode.brand:
        return 'Đang tìm kiếm biểu trưng';
    }
  }

  String get statusText {
    switch (this) {
      case RecognitionMode.object:
        return 'Đang tìm kiếm vật thể...';
      case RecognitionMode.text:
        return 'Căn chỉnh văn bản vào khung';
      case RecognitionMode.currency:
        return 'Căn chỉnh tờ tiền vào khung';
      case RecognitionMode.brand:
        return 'Giữ camera ổn định để quét logo';
    }
  }

  String get actionLabel {
    switch (this) {
      case RecognitionMode.object:
        return 'Vật thể';
      case RecognitionMode.text:
        return 'Văn bản';
      case RecognitionMode.currency:
        return 'Tiền tệ';
      case RecognitionMode.brand:
        return 'Thương hiệu';
    }
  }

  IconData get icon {
    switch (this) {
      case RecognitionMode.object:
        return Icons.category_rounded;
      case RecognitionMode.text:
        return Icons.description_rounded;
      case RecognitionMode.currency:
        return Icons.payments_rounded;
      case RecognitionMode.brand:
        return Icons.workspace_premium_rounded;
    }
  }

  IconData get actionIcon {
    switch (this) {
      case RecognitionMode.object:
        return Icons.view_in_ar_rounded;
      case RecognitionMode.text:
        return Icons.camera_alt_rounded;
      case RecognitionMode.currency:
        return Icons.currency_exchange_rounded;
      case RecognitionMode.brand:
        return Icons.workspace_premium_rounded;
    }
  }

  bool get circularFrame => this == RecognitionMode.object;

  Size get frameSize {
    switch (this) {
      case RecognitionMode.object:
        return const Size(280, 280);
      case RecognitionMode.text:
        return const Size(280, 380);
      case RecognitionMode.currency:
        return const Size(250, 360);
      case RecognitionMode.brand:
        return const Size(250, 250);
    }
  }
}

extension AppLanguageX on AppLanguage {
  String get label {
    switch (this) {
      case AppLanguage.vietnamese:
        return 'Tiếng Việt';
      case AppLanguage.english:
        return 'English';
    }
  }

  String get leading {
    switch (this) {
      case AppLanguage.vietnamese:
        return 'VN';
      case AppLanguage.english:
        return 'EN';
    }
  }
}
