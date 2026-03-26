import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/recognition/presentation/index.dart';

class VisualImpairedAssistantApp extends StatelessWidget {
  const VisualImpairedAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnboardingBloc()),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Visual Impaired Assistant',
        theme: ThemeData.dark(),
        home: const OnboardingScreen(),
      ),
    );
  }
}
