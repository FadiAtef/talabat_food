import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/feature/tracking/logic/tracking_cubit.dart';
import 'package:untitled/widget/build_title.dart';
import 'package:untitled/widget/custom_app_bar_app.dart';
import 'package:untitled/widget/custom_bottom.dart';

import 'package:untitled/feature/tracking/ui/widgets/tracking_item_widget.dart';
import 'package:untitled/feature/tracking/ui/widgets/tracking_info_card.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackingCubit, TrackingState>(
      builder: (context, state) {
        if (state is TrackingLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        int minutes = 15;
        if (state is TrackingLoaded) {
          minutes = state.minutesLeft;
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                CustomAppBarApp(title: 'تتبع الطلب'),
                const SizedBox(height: 24),
                Image.asset(AppAssets.cuate, width: double.infinity),
                const SizedBox(height: 24),
                const Text(
                  'سيتم توصيل طعامك خلال',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color(0xff686868),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$minutes ',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'دقيقة ',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Color(0xff686868),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const BuildTitle(title: 'معلومات الطلب'),
                const SizedBox(height: 12),
                const TrackingItemWidget(),
                const SizedBox(height: 16),
                const TrackingInfoCard(),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      const CustomBottom(
                        text: 'تتبع الطلب',
                        colorText: Colors.white,
                        colorBottom: Color(0xFFF55540),
                      ),
                      const SizedBox(width: 8),
                      CustomBottom(
                        text: 'الغاء الطلب',
                        colorText: const Color(0xFFF55540),
                        colorBottom: Colors.white,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
