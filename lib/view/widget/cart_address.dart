import 'package:app/data/model/addressmodel.dart';
import 'package:flutter/material.dart';

class CartAdsress extends StatelessWidget {
  const CartAdsress(
      {super.key,
      required this.datamodel,
      required this.color,
      required this.color2,
      required this.onDelete});
  final AddressModel datamodel;
  final Color color;
  final Color color2;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(5),
      child: ListTile(
        //isThreeLine: true,
        title: Text(
          datamodel.addressName!,
          style: TextStyle(color: color2),
        ),
        subtitle: Text("${datamodel.addressCity!}  ${datamodel.addressStreet!}",
            style: TextStyle(color: color2)),
        trailing: IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
