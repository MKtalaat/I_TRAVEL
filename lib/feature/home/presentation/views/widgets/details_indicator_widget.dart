import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_travel/feature/home/data/models/item_model/item_model.dart';
import 'package:i_travel/feature/home/presentation/cubits/item_details_cubit/item_details_cubit.dart';
import 'package:i_travel/feature/home/presentation/cubits/item_details_cubit/item_details_state.dart';
import 'package:i_travel/feature/home/presentation/views/widgets/custom_indicator_widget.dart';

class DetailsIndicatorWidget extends StatelessWidget {
  const DetailsIndicatorWidget({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: BlocBuilder<ItemDetailsCubit, ItemDetailsState>(
        builder: (context, state) {
          return CustomIndicatorWidget(
            count: item.images.length,
            currentIndex: ItemDetailsCubit.get(context).currentIndex,
          );
        },
      ),
    );
  }
}
