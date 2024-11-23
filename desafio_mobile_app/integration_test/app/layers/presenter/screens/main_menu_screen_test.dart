import 'package:desafio_mobile_app/app/common/app_styles.dart';
import 'package:desafio_mobile_app/app/layers/presenter/screens/main_menu_screen.dart';
import 'package:desafio_mobile_app/app/layers/presenter/widgets/field_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:desafio_mobile_app/app/common/utils/http/http_client.dart';
import 'package:desafio_mobile_app/app/common/utils/http/http_client_implementation.dart';
import 'package:desafio_mobile_app/app/layers/data/datasources/remote/remote_data_datasource.dart';
import 'package:desafio_mobile_app/app/layers/data/datasources/remote/remote_data_datasource_implementation.dart';
import 'package:desafio_mobile_app/app/layers/data/repositories/remote_repository_implementation.dart';
import 'package:desafio_mobile_app/app/layers/domain/repositories/remote_repository.dart';
import 'package:desafio_mobile_app/app/layers/domain/usecases/employeers_usecase.dart';
import 'package:desafio_mobile_app/app/layers/presenter/providers/remote_provider.dart';
import 'package:provider/provider.dart';

Widget buildTestableWidget({List<Map<String, dynamic>>? employeers}) {
  TestWidgetsFlutterBinding.ensureInitialized();
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
          textColor: appStyles.blackNeutral,
        ),
      ),
      home: MainMenuScreen(employeers: employeers),
    ),
  );
}

void main() {
  group('MainMenuScreen Widget Tests', () {
    late List<Map<String, dynamic>> mockEmployeers;

    setUp(() {
      mockEmployeers = [
        {
          "id": 7,
          "name": "Gabriel",
          "job": "Back-end",
          "admission_date": "2021-01-01T00:00:00.000Z",
          "phone": "5551234567890",
          "image":
              "https://img.favpng.com/25/7/23/computer-icons-user-profile-avatar-image-png-favpng-LFqDyLRhe3PBXM0sx2LufsGFU.jpg"
        },
        {
          "id": 8,
          "name": "Carla",
          "job": "Back-end",
          "admission_date": "2021-03-01T00:00:00.000Z",
          "phone": "5551234567890",
          "image":
              "https://www.clipartmax.com/png/middle/277-2772117_user-profile-avatar-woman-icon-avatar-png-profile-icon.png"
        },
        {
          "id": 10,
          "name": "Fernanda",
          "job": "Front-end",
          "admission_date": "2021-05-01T00:00:00.000Z",
          "phone": "5551234567890",
          "image":
              "https://www.clipartmax.com/png/middle/277-2772117_user-profile-avatar-woman-icon-avatar-png-profile-icon.png"
        }
      ];
    });

    testWidgets('should display all employees when search is empty', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(employeers: mockEmployeers));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
    });

    testWidgets('should display all employees when search is empty 2', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(employeers: mockEmployeers));
      await tester.pumpAndSettle();

      expect(find.text('Gabriel'), findsOneWidget);
      expect(find.text('Carla'), findsOneWidget);
      expect(find.text('Fernanda'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 2));
    });

    testWidgets('should display a header and search bar', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(employeers: mockEmployeers));
      await tester.pumpAndSettle();

      expect(find.text('Funcionários'), findsOneWidget);
      expect(find.byType(FieldTextWidget), findsOneWidget);
      expect(find.byType(Badge), findsOneWidget);
      await Future.delayed(const Duration(seconds: 2));
    });
    testWidgets('Search bar', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(employeers: mockEmployeers));
      await tester.pumpAndSettle();
      
      // Pesquisar funcionário
      await tester.enterText(find.byType(FieldTextWidget), 'Gabriel');
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
    });

    testWidgets('Expansion panel', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(employeers: mockEmployeers));
      // Pesquisar por texto
      await tester.pumpAndSettle();
      var onTap = find.text('Gabriel');
      await Future.delayed(const Duration(seconds: 2));

      // Abrir detalhes
      await tester.tap(onTap);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      // Fechar detalhes
      await tester.tap(onTap);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      // Pesquisar funcionário
      await tester.enterText(find.byType(FieldTextWidget), 'Gabriel');
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
    });
  });
}
