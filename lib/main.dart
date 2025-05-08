import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_inspection_app/theme.dart';
import 'package:site_inspection_app/ui/dashboard.dart';
import 'bloc/inspection_bloc.dart';
import 'repository/inspection_repository.dart';
import 'bloc/inspection_event.dart';

void main() {
  final repository = InspectionRepository();
  runApp(MyApp(repository));
}

class MyApp extends StatelessWidget {
  final InspectionRepository repository;

  MyApp(this.repository);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customthemeData(context),
      home: BlocProvider(
        create: (_) => InspectionBloc(repository)..add(LoadInspectionItems()),
        child: HomeScreenData(),
      ),
    );
  }
}
