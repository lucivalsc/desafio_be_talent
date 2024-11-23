import 'package:flutter/material.dart';

class HeaderTableWidget extends StatelessWidget {
  const HeaderTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        border: Border.all(color: Colors.grey, width: .5),
        color: const Color.fromRGBO(237, 239, 251, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            const SizedBox(
              width: 50,
              child: Text(
                'Foto',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(width: 15),
            const Expanded(
                child: Text(
              'Nome',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )),
            SizedBox(
              width: 50,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.black,
                  ),
                  width: 8.0,
                  height: 8.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
