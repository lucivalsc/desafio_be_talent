import 'package:desafio_mobile_app/app/common/app_styles.dart';
import 'package:desafio_mobile_app/app/common/utils/http/http_client.dart';
import 'package:desafio_mobile_app/app/common/utils/http/http_client_implementation.dart';
import 'package:desafio_mobile_app/app/layers/data/datasources/remote/remote_data_datasource.dart';
import 'package:desafio_mobile_app/app/layers/data/datasources/remote/remote_data_datasource_implementation.dart';
import 'package:desafio_mobile_app/app/layers/data/repositories/remote_repository_implementation.dart';
import 'package:desafio_mobile_app/app/layers/domain/repositories/remote_repository.dart';
import 'package:desafio_mobile_app/app/layers/domain/usecases/employeers_usecase.dart';
import 'package:desafio_mobile_app/app/layers/presenter/providers/remote_provider.dart';
import 'package:desafio_mobile_app/starter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appStyles = AppStyles();
    return MultiProvider(
      providers: [
        Provider<IHttpClient>(create: (context) => HttpClientImplementation()),
        Provider<IRemoteDataDatasource>(create: (context) => RemoteDataDatasourceImplementation(context.read())),
        Provider<IDataRepository>(create: (context) => DataRepositoryImplementation(context.read())),
        Provider(create: (context) => EmployeersUsecase(context.read())),
        ChangeNotifierProvider(create: (context) => RemoteProvider(context.read())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: appStyles.whiteNeutral,
          useMaterial3: false,
          appBarTheme: AppBarTheme(
            backgroundColor: appStyles.whiteNeutral,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(color: appStyles.bluePrimary, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          textTheme: TextTheme(
            displayLarge: TextStyle(color: appStyles.bluePrimary, fontWeight: FontWeight.bold, fontSize: 14),
            displayMedium: TextStyle(color: appStyles.bluePrimary, fontWeight: FontWeight.normal, fontSize: 12),
            displaySmall: TextStyle(color: appStyles.bluePrimary, fontWeight: FontWeight.normal, fontSize: 12),
          ),
          iconTheme: IconThemeData(
            color: appStyles.bluePrimary,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(appStyles.bluePrimary),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            labelStyle: TextStyle(color: appStyles.bluePrimary),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                color: appStyles.gray10,
                width: 0.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                color: appStyles.gray10,
                width: 0.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                color: appStyles.gray10,
                width: 0.5,
              ),
            ),
            fillColor: appStyles.gray10,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: appStyles.blue10,
            selectedItemColor: appStyles.bluePrimary,
            unselectedItemColor: appStyles.bluePrimary,
          ),
          badgeTheme: BadgeThemeData(
            backgroundColor: appStyles.bluePrimary,
            textColor: appStyles.blue10,
          ),
          expansionTileTheme: ExpansionTileThemeData(
            iconColor: appStyles.bluePrimary,
            collapsedIconColor: appStyles.bluePrimary,
            textColor: appStyles.blackNeutral,
          ),
        ),
        home: const StarterScreen(),
      ),
    );
  }
}
