import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_inspection_app/models/inspection_item.dart';
import 'inspection_event.dart';
import 'inspection_state.dart';
import '../repository/inspection_repository.dart';

class InspectionBloc extends Bloc<InspectionEvent, InspectionState> {
  final InspectionRepository repository;

  InspectionBloc(this.repository) : super(InspectionState(items: [])) {
    on<LoadInspectionItems>(_onLoad);
    on<UpdateInspectionStatus>(_onUpdate);
    on<ResetInspectionStatuses>(_onReset);
  }

  void _onLoad(LoadInspectionItems event, Emitter<InspectionState> emit) async {
    final items = await repository.getInspectionItems();
    emit(InspectionState(items: items));
  }

  void _onUpdate(UpdateInspectionStatus event, Emitter<InspectionState> emit) {
    final updatedItems = List.of(state.items);
    updatedItems[event.index] =
        updatedItems[event.index].copyWith(status: event.status);
    emit(InspectionState(items: updatedItems));
  }

  void _onReset(ResetInspectionStatuses event, Emitter<InspectionState> emit) {
    final resetItems =
        state.items.map((e) => e.copyWith(status: InspectionStatus.pending)).toList();
    emit(InspectionState(items: resetItems));
  }
}
