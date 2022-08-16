import 'package:flutter/material.dart';
import 'package:flutter_weather_06072022/data/model/climate.dart';
import 'package:flutter_weather_06072022/data/remote/api/api_service.dart';
import 'package:flutter_weather_06072022/data/repository/climate_repository.dart';
import 'package:flutter_weather_06072022/presentations/features/home/home_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => ApiService()),
        ProxyProvider<ApiService, ClimateRepository>(
            update: (context, apiService, climateRepository) {
          climateRepository ??= ClimateRepository();
          climateRepository.updateClimateRepository(apiService: apiService);
          return climateRepository;
        }),
        ChangeNotifierProxyProvider<ClimateRepository, HomeController>(
            create: (context) => HomeController(),
            update: (context, repository, controller) {
              controller ??= HomeController();
              controller.updateClimateRepository(climateRepository: repository);
              return controller;
            })
      ],
      child: HomeDemo(),
    );
  }
}

class HomeDemo extends StatefulWidget {
  const HomeDemo({Key? key}) : super(key: key);

  @override
  State<HomeDemo> createState() => _HomeDemoState();
}

class _HomeDemoState extends State<HomeDemo> {
  HomeController? homeController;

  @override
  void initState() {
    super.initState();
    homeController = context.read();
    homeController?.getTempFromCityName(cityName: "Hanoi");
  }

  Climate getClimate() {
    return context.watch<HomeController>().climate;
  }

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {
            homeController?.getTempFromCityName(cityName: "London");
          }, child: Text("Change")),
          Center(child: Text(getClimate().name)),
        ],
      )
    );
  }
}
