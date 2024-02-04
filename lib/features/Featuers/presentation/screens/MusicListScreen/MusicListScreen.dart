import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/Colors.dart';
import '../../Cubits/Access_storge_cubit_cubit/access_storge_cubit_cubit.dart';
import 'widgets/wedigets.dart';

class MusicList extends StatelessWidget {
  const MusicList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccessStorgeCubitCubit, AccessStorgeCubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CutemAppBar(context),
          body: AccessStorgeCubitCubit.get(context).isLoading ||
                  AccessStorgeCubitCubit.get(context).songs.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: App_color.Slider_color,
                  ),
                )
              : Body(context),
        );
      },
    );
  }
}
