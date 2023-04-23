import 'dart:developer';

import 'package:data_structures_ui/data_structures/model/treenodemodel.dart';
import 'package:data_structures_ui/data_structures/widgets/circleNode.dart';
import 'package:data_structures_ui/main.dart';
import 'package:data_structures_ui/provider/treeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TreePage extends StatefulWidget {
  TreePage({Key? key}) : super(key: key);

  @override
  State<TreePage> createState() => _TreePageState();
}

const double nodeSize = 50;
TreeNodeModel model = TreeNodeModel(
    height: [1],
    level: 0,
    parentPosition: Offset.zero,
    position: Offset(w * 0.5, 0),
    children: []);

class _TreePageState extends State<TreePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model.height[0] = model.height[0] + 1;
    model.children.add(TreeNodeModel(
        level: model.level + 1,
        height: model.height,
        value: model.value + model.children.length + 1,
        parent: model,
        parentPosition: model.position,
        position: Offset(
            model.position.dx - ((model.height[0] - 2) * 2 + 1) * nodeSize,
            model.position.dy + nodeSize * 2),
        children: []));

    model.children.add(TreeNodeModel(
        height: model.height,
        level: model.level + 1,
        parent: model,
        value: model.value + model.children.length + 1,
        parentPosition: model.position,
        position: Offset(
            model.position.dx + ((model.height[0] - 2) * 2 + 1) * nodeSize,
            model.position.dy + nodeSize * 2),
        children: []));
  }

  late TreeProvider tp;
  @override
  Widget build(BuildContext context) {
    // List<int> list = [];
    // addints(list, 8);
    tp = Provider.of<TreeProvider>(context);

    model.children[0].position = Offset(
        model.position.dx - ((model.height[0] - 2) * 2 + 1) * nodeSize,
        model.position.dy + nodeSize * 2);
         model.children[1].position = Offset(
        model.position.dx + ((model.height[0] - 2) * 2 + 1) * nodeSize,
        model.position.dy + nodeSize * 2);
    log(" h bef " + model.height.toString());
    getChildrenModelsWidgets(model);
    log(" h aft " + model.height.toString());
    return Scaffold(
      backgroundColor: Colors.black87,
      floatingActionButton: ElevatedButton(
          onPressed: () {
            setState(() {});
          },
          child: Text("UI")),
      body: Stack(children: [
        ...(getChildrenModelsWidgets(model)),
        CircleNode(model),
        CircleNode(model.children[0]),
        CircleNode(model.children[1]),
        if (model.children[0].children.isNotEmpty)
          ...(model.children[0].children.map((e) => CircleNode(e)))
      ]),
    );
  }

  List<Widget> getChildrenModelsWidgets(TreeNodeModel model) {
    List<TreeNodeModel> models = [];
    TreeNodeModel temp = TreeNodeModel.copyWith(model);
    getChildrenModelsRecursively(models, temp);
    return [...models.map((e) => CircleNode(e))];
  }

  void getChildrenModelsRecursively(
      List<TreeNodeModel> models, TreeNodeModel temp) {
    models.add(temp);
    print("l " + models.length.toString());
    // models.map((e) {
    //   print(e
    // .value.toString());
    // });
    for (TreeNodeModel e in models) {
      print(e.value);
    }
    if (temp.children.isEmpty) {
      return;
    }
    for (TreeNodeModel t in temp.children) {
      getChildrenModelsRecursively(models, t);
    }
  }

  void addints(List<int> list, int i) {
    list.add(i);
    print("list $list");
    if (i == 0) {
      return;
    }
    addints(list, i - 1);
  }
}
