import 'dart:developer';

import 'package:data_structures_ui/data_structures/model/treenodemodel.dart';
import 'package:data_structures_ui/data_structures/tree.dart';
import 'package:data_structures_ui/provider/treeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CircleNode extends StatelessWidget {
  final TreeNodeModel model;
  const CircleNode(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TreeProvider tp = Provider.of<TreeProvider>(context);
    return Positioned(
      left: model.position.dx - nodeSize * 0.5,
      top: model.position.dy,
      child: InkWell(
        onTap: () {
          if (model.children.isNotEmpty) {
            return;
          }

          model.height[0] =  model.height[0] + 1;
          log(" h circ " + model.height.toString());
          model.children.add(TreeNodeModel(
              height: model.height,
              value: model.value + model.children.length + 1,
              parent: model,
              level: model.level + 1,
              parentPosition: model.position,
              position: Offset(model.position.dx - nodeSize * 2,
                  model.position.dy + nodeSize * 2),
              children: []));

          model.children.add(TreeNodeModel(
              height: model.height,
              parent: model,
              level: model.level + 1,
              value: model.value + model.children.length + 1,
              parentPosition: model.position,
              position: Offset(model.position.dx + nodeSize * 2,
                  model.position.dy + nodeSize * 2),
              children: []));
          tp.updateui();
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 206, 201, 184),
              shape: BoxShape.circle,
              border: Border.all()),
          child: Center(
            child: Text(model.height.toString()),
          ),
        ),
      ),
    );
  }
}
