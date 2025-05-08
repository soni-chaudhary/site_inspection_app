import '../models/inspection_item.dart';

class ApiAdapter {
  Future<List<InspectionItem>> fetchInspectionItems() async {
    await Future.delayed(Duration(milliseconds: 500));
    return [
      InspectionItem(name: 'Scaffolding', image: 'scaffolding.jpg'),
      InspectionItem(name: 'Electrical wiring', image: 'electrical_wiring.jpg'),
      InspectionItem(
          name: 'Personal Protective Equipment',
          image: 'personal_protective_equipment.jpg'),
      InspectionItem(
          name: 'Fire Extinguishers', image: 'fire_extinguishers.jpg'),
      InspectionItem(name: 'Safety Nets', image: 'safety_nets.jpg'),
    ];
  }
}
