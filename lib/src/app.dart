import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ui/configs/bloc_initialize_wrapper.dart';
import 'ui/configs/router/conditional_route.dart';
import 'ui/configs/router/responsive_framework_helper.dart';
import 'ui/configs/router/route_animation.dart';
import 'ui/configs/router/routes.dart';
import 'ui/configs/screen_config.dart';
import 'ui/configs/theme/theme_config.dart';
import 'ui/generic/widgets/wrappers/focus_handler.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    final AppThemeConfig appThemeConfig = AppThemeConfig();
    final ResponsiveFrameworkHelper responsiveFrameworkHelper =
        ResponsiveFrameworkHelper();
    return BlocInitializer(
      child: FocusHandler(
        child: ScreenUtilInit(
          designSize:
              Size(ScreenConfig.screenSizeWidth, ScreenConfig.screenSizeHeight),
          builder: (context, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appThemeConfig.getThemeData(),
            builder: (context, child) =>
                responsiveFrameworkHelper.responsiveBreakpointsBuilder(child!),
            initialRoute: CustomRouter.welcomeScreenRouteName,
            onGenerateRoute: (RouteSettings settings) {
              return Routes.fadeThrough(
                settings,
                (context) {
                  return ConditionalRouteWidget(
                    builder: (context, child) => responsiveFrameworkHelper
                        .responsiveFrameworkMaxWidthBox(
                      context,
                      child!,
                    ),
                    routes: CustomRouter.routes.keys.toList(),
                    child:
                        responsiveFrameworkHelper.bouncingScrollWrapperBuilder(
                      context,
                      settings,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
