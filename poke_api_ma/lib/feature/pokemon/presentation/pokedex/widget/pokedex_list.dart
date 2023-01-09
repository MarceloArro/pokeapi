import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_api_ma/core/constant/assets_constant.dart';
import 'package:poke_api_ma/core/constant/color_constant.dart';
import 'package:poke_api_ma/core/constant/router_constant.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/common/card/pokemon_card.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokedex/cubit/pokedex_cubit.dart';

class PokedexList extends StatefulWidget {
  const PokedexList({super.key});

  @override
  State<PokedexList> createState() => _PokedexListState();
}

class _PokedexListState extends State<PokedexList> {
  final _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && !isLoading) {
      context.read<PokedexCubit>().pokemonFetched();
      isLoading = true;
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<PokedexCubit, PokedexState>(
      builder: (context, state) {
        if (state.status == PokedexStatus.failure) {
          return const Center(child: Text('failed to fetch pokemons'));
        }
        if (state.status == PokedexStatus.success) {
          isLoading = false;
          if (state.pokemonList.isEmpty) {
            return const Center(child: Text('no pokemon'));
          }
          return GridView.builder(
            shrinkWrap: true,
            itemCount: state.hasReachedMax
                ? state.pokemonList.length
                : sizeWidth > 620
                    ? sizeWidth > 1100
                        ? state.pokemonList.length + 4
                        : state.pokemonList.length + 3
                    : state.pokemonList.length + 2,
            controller: _scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: sizeWidth > 620
                  ? sizeWidth > 1100
                      ? 4
                      : 3
                  : 2,
              childAspectRatio: 1.4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (BuildContext context, int index) {
              return index >= state.pokemonList.length
                  ? DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: AppColors.lightGrey,
                      ),
                      child: Center(
                        child: Image.asset(
                          AppAssets.pokeballLoading,
                          height: 80,
                        ),
                      ),
                    )
                  : PokemonCard(
                      pokemon: state.pokemonList[index],
                      onPress: () {
                        context.push(
                          pokemonPath,
                          extra: state.pokemonList[index],
                        );
                      },
                    );
            },
          );
        }
        if (state.status == PokedexStatus.initial) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container();
      },
    );
  }
}
