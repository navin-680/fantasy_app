import 'package:flutter/material.dart';

import 'add_player_card_widget.dart';

class WicketKeeperListWidget extends StatefulWidget {
  const WicketKeeperListWidget({super.key});

  @override
  State<WicketKeeperListWidget> createState() => _WicketKeeperListWidgetState();
}

class _WicketKeeperListWidgetState extends State<WicketKeeperListWidget> {
  List<bool> itemSelection = List.generate(6, (index) => false);

  int selectedCount = 0;

  void handleItemSelection(int index) {
    setState(() {
      if (itemSelection[index]) {
        // If already selected, unselect it
        itemSelection[index] = false;
        selectedCount--;
      } else {
        // If not selected, select it if less than 2 items are already selected
        if (selectedCount < 2) {
          itemSelection[index] = true;
          selectedCount++;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return AddPlayerCardWidget(
              onTap: () => handleItemSelection(index),
              index: index,
              itemSelection: itemSelection);
        });
  }
}
