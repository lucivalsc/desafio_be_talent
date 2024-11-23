import 'package:desafio_mobile_app/app/layers/data/datasources/remote/remote_data_datasource_implementation.dart';
import 'package:desafio_mobile_app/app/layers/domain/repositories/remote_repository.dart';
import 'package:desafio_mobile_app/app/layers/presenter/providers/remote_provider.dart';
import 'package:desafio_mobile_app/app/layers/presenter/screens/main_menu_screen.dart';
import 'package:desafio_mobile_app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StarterScreen extends StatefulWidget {
  const StarterScreen({super.key});

  @override
  State<StarterScreen> createState() => _StarterScreenState();
}

class _StarterScreenState extends State<StarterScreen> {
  late Future<void> future;
  late RemoteProvider remoteProvider;
  late IDataRepository repository;
  late RemoteDataDatasourceImplementation remoteDataDatasource;

  List? employeers = [];
  Future<void> startApp() async {
    remoteProvider = Provider.of<RemoteProvider>(context, listen: false);
    employeers = await remoteProvider.employeers();
  }

  @override
  void initState() {
    super.initState();
    future = startApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MainMenuScreen(employeers: employeers);
        } else {
          return const SplashScreen();
        }
      },
    );
  }
}
