import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:site_inspection_app/bloc/inspection_bloc.dart';
import 'package:site_inspection_app/bloc/inspection_event.dart';
import 'package:site_inspection_app/bloc/inspection_state.dart';
import 'package:site_inspection_app/models/inspection_item.dart';
import 'package:site_inspection_app/repository/inspection_repository.dart';

void main() {
  late InspectionBloc bloc;

  setUp(() {
    bloc = InspectionBloc(InspectionRepository());
  });

  blocTest<InspectionBloc, InspectionState>(
    'Loads inspection items',
    build: () => bloc,
    act: (bloc) => bloc.add(LoadInspectionItems()),
    wait: const Duration(milliseconds: 600),
    expect: () => [isA<InspectionState>()],
  );

  blocTest<InspectionBloc, InspectionState>(
    'Updates inspection status',
    build: () => bloc,
    seed: () => InspectionState(items: [
      InspectionItem(name: 'Item 1', image: 'fire_extinguishers.jpg'),
    ]),
    act: (bloc) => bloc.add(UpdateInspectionStatus(0, InspectionStatus.passed)),
    expect: () => [
      isA<InspectionState>().having(
        (s) => s.items[0].status,
        'status',
        InspectionStatus.passed,
      ),
    ],
  );

  blocTest<InspectionBloc, InspectionState>(
    'Resets all inspection statuses',
    build: () => bloc,
    seed: () => InspectionState(items: [
      InspectionItem(
          name: 'Item 1',
          status: InspectionStatus.failed,
          image: 'fire_extinguishers.jpg'),
    ]),
    act: (bloc) => bloc.add(ResetInspectionStatuses()),
    expect: () => [
      isA<InspectionState>().having(
        (s) => s.items[0].status,
        'status',
        InspectionStatus.pending,
      ),
    ],
  );
}
