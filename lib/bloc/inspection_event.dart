import '../models/inspection_item.dart';

abstract class InspectionEvent {}

class LoadInspectionItems extends InspectionEvent {}

class UpdateInspectionStatus extends InspectionEvent {
  final int index;
  final InspectionStatus status;

  UpdateInspectionStatus(this.index, this.status);
}

class ResetInspectionStatuses extends InspectionEvent {}
