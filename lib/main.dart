import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/routing/routing.dart';
import 'config/theme/style.dart';
import 'features/Featuers/presentation/Cubits/Access_storge_cubit_cubit/access_storge_cubit_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AccessStorgeCubitCubit()
            ..CheckPremissionToCollectSongsFromStorge(),
        )
      ],
      child: BlocConsumer<AccessStorgeCubitCubit, AccessStorgeCubitState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: Routeing.MapOfAppRoutes,
            // initialRoute: Routeing.MusicListScreen,
            home: check(),
            theme: themes.LightMode,
            darkTheme: themes.DarkTheme,
            themeMode: AccessStorgeCubitCubit.get(context).ChangeTheme
                ? ThemeMode.light
                : ThemeMode.dark,
          );
        },
      ),
    );
  }
}

class check extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Transform.translate Example'),
        ),
        body: Center(
          child: Transform.translate(
            offset: Offset(50.0,
                50.0), // Translate by 50 units in the x-axis and 100 units in the y-axis
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
