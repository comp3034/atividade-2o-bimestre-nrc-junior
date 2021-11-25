import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';

class SelectObjetivoWidget extends StatelessWidget {
  const SelectObjetivoWidget({
    Key? key,
    required List<String> items,
  })  : _items = items,
        super(key: key);

  final List<String> _items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: const EdgeInsets.only(left: 24),
      child: DirectSelectList(
        values: _items,
        itemBuilder: (value) {
          return DirectSelectItem(
            itemHeight: 56,
            value: value,
            itemBuilder: (context, value) {
              return Text(
                '$value',
                style: TextStyle(fontSize: 24),
              );
            },
          );
        },
      ),
    );
  }
}
