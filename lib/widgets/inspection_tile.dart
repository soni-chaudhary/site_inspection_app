import 'package:flutter/material.dart';
import '../models/inspection_item.dart';

class InspectionTile extends StatelessWidget {
  final InspectionItem item;
  final Function(InspectionStatus) onStatusChange;

  const InspectionTile(
      {super.key, required this.item, required this.onStatusChange});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: SizedBox(
            height: 50,
            width: 50,
            child: Image.asset("assets/${item.image}", fit: BoxFit.contain)),
        title: Text(
          item.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Row(
          children: [
            item.status.name == "passed"
                ? Container(
                    margin: EdgeInsets.only(right: 5),
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(40)),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 12,
                    ),
                  )
                : item.status.name == "failed"
                    ? Container(
                        margin: EdgeInsets.only(right: 5),
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(40)),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 12,
                        ),
                      )
                    : item.status.name == "notApplicable"
                        ? Container(
                            margin: EdgeInsets.only(right: 5),
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40)),
                            child: Icon(
                              Icons.block,
                              color: Colors.redAccent,
                              size: 18,
                            ),
                          )
                        : SizedBox(),
            Text(
              item.status.name.toUpperCase(),
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        trailing: PopupMenuButton<InspectionStatus>(
          onSelected: onStatusChange,
          icon: const Icon(Icons.more_vert),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: InspectionStatus.passed,
              child: Text('✅ Passed'),
            ),
            const PopupMenuItem(
              value: InspectionStatus.failed,
              child: Text('❌ Failed'),
            ),
            const PopupMenuItem(
              value: InspectionStatus.notApplicable,
              child: Text('🚫 N/A'),
            ),
          ],
        ),
      ),
    );
  }
}
