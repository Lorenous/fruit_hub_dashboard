import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub_dashboard/features/dashboard/presentation/widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static const String routeName = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
        context,
        text: 'Dashboard',
        showBackButton: false,
      ),
      body: const DashboardViewBody(),
    );
  }
}
