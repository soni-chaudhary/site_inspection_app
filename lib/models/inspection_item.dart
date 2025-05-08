enum InspectionStatus { pending, passed, failed, notApplicable }

class InspectionItem {
  final String name;
  InspectionStatus status;
  final String image;

  InspectionItem(
      {required this.image,
      required this.name,
      this.status = InspectionStatus.pending});

  InspectionItem copyWith({String? name, InspectionStatus? status}) {
    return InspectionItem(
      name: name ?? this.name,
      status: status ?? this.status,
      image: image,
    );
  }
}
