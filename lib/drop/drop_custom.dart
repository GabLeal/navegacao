import 'package:animacoes/drop/controller.dart';
import 'package:animacoes/drop/teste.dart';
import 'package:animacoes/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class DropCustom extends StatefulWidget {
  const DropCustom({Key? key}) : super(key: key);

  @override
  State<DropCustom> createState() => _DropCustomState();
}

class _DropCustomState extends State<DropCustom> {
  MenuController<ModelExemplo> menuController = MenuController(
    items: [
      ModelExemplo(name: 'RJ', value: 12),
      ModelExemplo(name: 'SP', value: 10),
      ModelExemplo(name: 'AC', value: 4),
      ModelExemplo(name: 'MG', value: 7),
      ModelExemplo(name: 'RS', value: 5),
    ],
  );

  @override
  Widget build(BuildContext context) {
    HomeController _homeController = Provider.of<HomeController>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () =>
              _homeController.changeCurrentScreen(CurrentScreen.idle),
        ),
        title: Text("CHATS"),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Titulo',
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                CustomDropdown<ModelExemplo>(
                    itemEscolhido: Text(menuController.itemTextSelected),
                    menu: menuController,
                    icon: const FaIcon(
                      FontAwesomeIcons.chevronDown,
                      size: 12,
                    ),
                    child: const Text(
                      'Placeholder',
                    ),
                    onChange: (ModelExemplo value, int index) {
                      menuController.itemSelected(value.name);
                    },
                    dropdownButtonStyle: const DropdownButtonStyle(
                      width: 300,
                      height: 40,
                      elevation: 1,
                      backgroundColor: Colors.white,
                      primaryColor: Colors.black87,
                    ),
                    dropdownStyle: DropdownStyle(
                      borderRadius: BorderRadius.circular(8),
                      elevation: 0,
                      padding: const EdgeInsets.all(5),
                    ),
                    items: menuController.items.map((e) {
                      return DropdownItem<ModelExemplo>(
                        value: e,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(e.name),
                          ),
                        ),
                      );
                    }).toList()
                    // items: [
                    //   'item 1',
                    //   'item 2',
                    //   'item 3',
                    //   'item 4',
                    //   'item 5',
                    //   'item 5',
                    //   'item 4',
                    //   'item 1',
                    //   'item 2',
                    //   'item 3',
                    //   'item 4',
                    //   'item 5',
                    //   'item 5',
                    //   'item 4',
                    // ]
                    //     .asMap()
                    //     .entries
                    //     .map(
                    //       (item) => DropdownItem<int>(
                    //         value: item.key + 1,
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //               border:
                    //                   Border.all(color: Colors.blue, width: 1),
                    //               borderRadius: BorderRadius.circular(5)),
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(8.0),
                    //             child: Text(item.value),
                    //           ),
                    //         ),
                    //       ),
                    //     )
                    //     .toList(),
                    ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: Text(
                  '*** outros componentes que podem ficar abaixo deste widget ***'),
            )
          ],
        ),
      ),
    );
  }
}
