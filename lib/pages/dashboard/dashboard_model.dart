import '/components/side_nav02_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue;
  // Model for SideNav02 component.
  late SideNav02Model sideNav02Model;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideNav02Model = createModel(context, () => SideNav02Model());
  }

  void dispose() {
    unfocusNode.dispose();
    sideNav02Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
