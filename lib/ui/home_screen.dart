import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_inspection_app/helper/database_helper.dart';
import 'package:site_inspection_app/models/daily_report.dart';
import 'package:site_inspection_app/widgets/custom_button.dart';
import '../bloc/inspection_bloc.dart';
import '../bloc/inspection_event.dart';
import '../bloc/inspection_state.dart';
import '../widgets/inspection_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Home'))),
      body: BlocBuilder<InspectionBloc, InspectionState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                      children: [
                        TextSpan(
                          text: '${state.passedCount}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                        const TextSpan(text: ' passed / '),
                        TextSpan(
                          text: '${state.items.length}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(text: ' total'),
                      ],
                    ),
                  )),
              Expanded(
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    return InspectionTile(
                      item: state.items[index],
                      onStatusChange: (status) {
                        context
                            .read<InspectionBloc>()
                            .add(UpdateInspectionStatus(index, status));
                      },
                    );
                  },
                ),
              ),
              CustomButton(
                text: 'Reset All',
                onTap: () {
                  context.read<InspectionBloc>().add(ResetInspectionStatuses());
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                text: 'Save report',
                onTap: () async {
                  if (state.passedCount == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                       "Select at least 1 data"
                      ),
                      backgroundColor:Colors.orange,
                    ),
                  );
                    return;
                  }
                  final report = DailyReport(
                    date: DateTime.now(),
                    totalPassed: state.passedCount.toString(),
                  );

                  final success =
                      await DatabaseHelper.instance.insertReport(report);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        success
                            ? 'Report saved successfully!'
                            : 'Today\'s report already exists.',
                      ),
                      backgroundColor: success ? Colors.green : Colors.orange,
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
