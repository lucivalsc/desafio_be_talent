import 'package:flutter/material.dart';

import 'package:desafio_mobile_app/app/common/functions.dart';

class TableRowWidget extends StatelessWidget {
  final Map item;
  const TableRowWidget({
    super.key,
    required this.item,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: .5),
      ),
      child: ExpansionTile(
        title: Text(
          item['name'],
          style: const TextStyle(fontSize: 16),
        ),
        leading: ClipOval(
          child: Image.network(
            item['image'],
            width: 34.0,
            height: 34.0,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 34.0,
                height: 34.0,
                color: Colors.grey[300],
                child: const Icon(Icons.error, size: 18.0, color: Colors.red),
              );
            },
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextRowWidget(title: 'Cargo', subTitle: item['job']),
                TextRowWidget(title: 'Data de admissão', subTitle: formatDate(item['admission_date'])),
                TextRowWidget(title: 'Telefone', subTitle: formatPhone(item['phone'])),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextRowWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  const TextRowWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              subTitle,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
