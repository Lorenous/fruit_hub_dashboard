import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_text_styles.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF3F5F7),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          const Positioned(
            top: 8,
            right: 8,
            child: Icon(Icons.favorite_outline),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Image.asset(AppImages.imagesMelon),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('بطيخ', style: AppTextStyles.semiBold13),
                      Row(
                        children: [
                          Text(
                            '20جنية',
                            style: AppTextStyles.bold13.copyWith(
                              color: AppColors.secondry,
                            ),
                          ),
                          Text(
                            ' / الكيلو',
                            style: AppTextStyles.semiBold13.copyWith(
                              color: AppColors.lightSecondry,
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding: const EdgeInsets.all(10),
                              shape: const CircleBorder(),
                            ),
                            onPressed: () {},
                            child: const Icon(
                              Icons.add,
                              size: 24,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
