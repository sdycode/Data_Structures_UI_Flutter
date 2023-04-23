import 'package:flutter/material.dart';

class TreeNodeModel {
  int value = 0;
  int level;
  List<int> height;
  TreeNodeModel? parent;
  Offset parentPosition;
  Offset position;
  List<TreeNodeModel> children;
  TreeNodeModel({
    this.value = 0,
    this.parent,
    required this.height,
    required this.level,
    required this.parentPosition,
    required this.position,
    required this.children,
  });
  factory TreeNodeModel.copyWith(TreeNodeModel model) {
    return TreeNodeModel(
        value: model.value,
        parent: model.parent,
        level: model.level,
        height: model.height,
        parentPosition: model.parentPosition,
        position: model.position,
        children: model.children);
  }
}
