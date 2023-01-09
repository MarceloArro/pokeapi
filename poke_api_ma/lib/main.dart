import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_api_ma/core/constant/api_resource_constant.dart';
import 'package:poke_api_ma/core/theme/theme.dart';
import 'package:poke_api_ma/core/util/http_util.dart';
import 'package:poke_api_ma/feature/pokemon/data/pokemon.dart';
import 'package:poke_api_ma/router.dart';

void main() {
  EquatableConfig.stringify = true;
  // Step 2
  WidgetsFlutterBinding.ensureInitialized();
  // Step 3
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => PokemonRepository(
            remoteDataSource: PokemonRemoteDataSource(
              httpUtils: HttpUtils(
                host: AppAPIResource.host,
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        theme: lightAppTheme,
        routerConfig: router,
      ),
    );
  }
}
