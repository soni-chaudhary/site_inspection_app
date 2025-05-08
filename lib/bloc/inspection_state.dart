import 'package:equatable/equatable.dart';
import '../models/inspection_item.dart';

class InspectionState extends Equatable {
  final List<InspectionItem> items;

  InspectionState({required this.items});

  @override
  List<Object?> get props => [items];

  int get passedCount =>
      items.where((item) => item.status == InspectionStatus.passed).length;
}
