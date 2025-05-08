import '../models/inspection_item.dart';
import '../data/api_adapter.dart';

class InspectionRepository {
  final ApiAdapter _api = ApiAdapter();

  Future<List<InspectionItem>> getInspectionItems() {
    return _api.fetchInspectionItems();
  }
}
