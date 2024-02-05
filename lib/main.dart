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
            initialRoute: Routeing.MusicListScreen,
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
