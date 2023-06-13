import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../shared/utils/painter.dart';
import '../../states/home_state.dart';
import '../../stores/home_store.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_multiline_field.dart';
import '../widgets/custom_switch_tile.dart';
import '../widgets/custom_text_field.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({
    Key? key,
    this.title = 'Caxias Viajão',
  }) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final HomeStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();
  }

  @override
  void dispose() {
    Modular.dispose<HomeStore>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Card(
              elevation: 10,
              margin: EdgeInsets.zero,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    CustomTextField(
                      label: 'Nome',
                      controller: store.nameController,
                      marginBottom: 10,
                    ),
                    CustomMultilineField(
                      label: 'Dados',
                      controller: store.dataController,
                      marginBottom: 10,
                    ),
                    TripleBuilder<HomeStore, HomeState>(
                        store: store,
                        builder: (context, triple) {
                          return CustomSwitchTile(
                            label: 'Usar Cache',
                            value: triple.state.useCache,
                            onChanged: store.onChangeUseCache,
                            marginBottom: 10,
                          );
                        }),
                    CustomButton(
                      label: 'Obter Rota',
                      onPressed: store.getRoutes,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: ScopedBuilder<HomeStore, HomeState>(
                store: store,
                onError: (context, error) {
                  return Text(error.toString());
                },
                onLoading: (context) =>
                    const Center(child: CircularProgressIndicator()),
                onState: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: const Text('Tempo de execução'),
                              subtitle:
                                  Text(state.routes?.execTime.toString() ?? ''),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: const Text('Valor ótimo'),
                              subtitle: Text(
                                  state.routes?.greatValue.toString() ?? ''),
                            ),
                          ),
                        ],
                      ),
                      CustomPaint(
                        painter: Painter(
                          routes: state.routes,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
