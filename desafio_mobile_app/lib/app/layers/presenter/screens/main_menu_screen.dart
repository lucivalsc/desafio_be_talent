import 'dart:async';

import 'package:desafio_mobile_app/app/common/app_styles.dart';
import 'package:desafio_mobile_app/app/common/debouncer.dart';
import 'package:desafio_mobile_app/app/layers/presenter/widgets/field_text_widget.dart';
import 'package:desafio_mobile_app/app/layers/presenter/widgets/header_table_widget.dart';
import 'package:desafio_mobile_app/app/layers/presenter/widgets/table_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainMenuScreen extends StatefulWidget {
  final List? employeers;
  const MainMenuScreen({
    super.key,
    this.employeers,
  });

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  final appStyles = AppStyles();
  final debouncer = Debouncer(milliseconds: 1000);
  late Future<void> future;
  List filtered1 = [];

  TextEditingController searchController = TextEditingController();
  String searchBarText = '';

  Future<void> initStarter() async {
    searchEmployeer();
  }

  searchEmployeer() {
    List originals1 = widget.employeers ?? [];
    if (searchBarText.isEmpty) {
      filtered1 = List.from(originals1);
    } else {
      filtered1 = originals1.where((item) {
        if (item['name'].toLowerCase().contains(searchBarText.toLowerCase())) {
          return true;
        } else {
          return false;
        }
      }).toList();
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    future = initStarter();
  }

  @override
  void dispose() {
    debouncer.dispose(); // Cancela o Timer pendente.
    searchController.dispose(); // Libera o controller de texto.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: appStyles.gray5,
                child: Text(
                  'CG',
                  style: TextStyle(
                    color: appStyles.blackNeutral,
                    fontSize: 16,
                  ),
                ),
              ),
              IconButton(
                icon: Badge.count(
                  count: 10,
                  largeSize: 20,
                  child: SvgPicture.asset(
                    'lib/app/common/assets/bell.svg',
                    color: appStyles.blackNeutral,
                    width: 32,
                    height: 32,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Funcionários',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          FieldTextWidget(
            label: 'Pesquisar',
            controller: searchController,
            onClickClear: () {
              searchBarText = '';
              searchEmployeer();
            },
            onChanged: (text) {
              searchBarText = text;
              debouncer.run(() async {
                await searchEmployeer();
              });
            },
          ),
          const SizedBox(height: 20),
          const HeaderTableWidget(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filtered1.length,
            itemBuilder: (context, index) {
              var item = filtered1[index];
              return TableRowWidget(item: item);
            },
          )
        ],
      ),
    );
  }
}
