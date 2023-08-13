import '/components/side_nav02_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
