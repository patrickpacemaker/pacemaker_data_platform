import 'package:pacemaker_data_platform/components/dropdown05_notifications_model.dart';
import 'package:pacemaker_data_platform/components/dropdown05_notifications_widget.dart';
import 'package:pacemaker_data_platform/model/model.dart';
import 'package:pacemaker_data_platform/model/sample_view.dart';
import 'package:pacemaker_data_platform/pages/profile/profile_widget.dart';
import 'package:pacemaker_data_platform/samples/chart/cartesian_charts/series_features/data_label/default_data_labels.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late bool isCardView;
  late SampleModel model;

  List<ChartSampleData>? newchartData;

  @override
  void initState() {
    model = SampleModel.instance;

    newchartData = <ChartSampleData>[
      ChartSampleData(
        x: 'Mo',
        y: 2,
        secondSeriesYValue: 2,
      ),
      ChartSampleData(
        x: 'Tu',
        y: 4,
        secondSeriesYValue: 37,
      ),
      ChartSampleData(
        x: 'We',
        y: 6,
        secondSeriesYValue: 39,
      ),
      ChartSampleData(
        x: 'Th',
        y: 1,
        secondSeriesYValue: 43,
      ),
      ChartSampleData(
        x: 'Fr',
        y: 7,
        secondSeriesYValue: 48,
      ),
      ChartSampleData(
        x: 'Sa',
        y: 3,
        secondSeriesYValue: 54,
      ),
      ChartSampleData(
        x: 'Su',
        y: 6,
        secondSeriesYValue: 57,
      ),
    ];

    isCardView = model.isCardView && !model.isWebFullView;

    _labelPos = 'top';
    _labelAln = 'center';
    _labelPosition = ChartDataLabelAlignment.top;
    _chartAlignment = ChartAlignment.center;
    _seriescolor = true;
    _horizontalPaddding = 0;
    _verticalPaddding = 0;
    _chartAlign = <String>['near', 'far', 'center'].toList();
    _positionType = <String>['outer', 'top', 'bottom', 'middle'].toList();
    _tooltipBehavior = TooltipBehavior(enable: true);
    chartData = <ChartSampleData>[
      ChartSampleData(x: 17082023, y: 21, yValue: 12),
      ChartSampleData(x: 18082023, y: 24, yValue: 14),
      ChartSampleData(x: 19082023, y: 28, yValue: 5),
      ChartSampleData(x: 20082023, y: 27, yValue: 9),
      ChartSampleData(x: 21082023, y: 23, yValue: 17),
      ChartSampleData(x: 22082023, y: 23, yValue: 4)
    ];
    super.initState();
    _model = createModel(context, () => DashboardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  late bool _seriescolor;
  late String _labelPos;
  late String _labelAln;

  late double _horizontalPaddding;
  late double _verticalPaddding;
  List<String>? _positionType;
  List<String>? _chartAlign;
  List<ChartSampleData>? chartData;
  ChartDataLabelAlignment? _labelPosition;
  ChartAlignment? _chartAlignment;
  TooltipBehavior? _tooltipBehavior;

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.15,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  border: Border.all(
                    width: 0.5,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.15,
                      height: 125.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 90.0, 0.0),
                              child: InkWell(
                                onTap: () async {
                                  context.pushNamed('dashboard');
                                },
                                child: Container(
                                  child: SvgPicture.asset(
                                    'assets/images/pacemaker_logo.svg',
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 25.0),
                              child: Text(
                                "admin@pacemaker.ai",
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w300,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 250.0,
                      height: 125.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                icon: FaIcon(
                                  FontAwesomeIcons.bell,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30.0,
                                ),
                                onPressed: () {
                                  showDropdownNotificationDialog(context);
                                },
                              ),
                              Container(
                                width: 50.0,
                                height: 50.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/Ellipse_9.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.85,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.15,
                        height: MediaQuery.sizeOf(context).height * 0.85,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(0.0),
                          border: Border.all(
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        DataLabelDefault(
                                                            Key as Key)));
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.easeInOut,
                                        width: double.infinity,
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF675AFF),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.space_dashboard_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                size: 24.0,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    "Dashboard",
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('Category');
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.easeInOut,
                                        width: double.infinity,
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.category_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child:
                                                      Text("Top Level Category",
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.easeInOut,
                                      width: double.infinity,
                                      height: 44.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.settings_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  "Idea?",
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      "Settings",
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.easeInOut,
                                      width: double.infinity,
                                      height: 44.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.notifications_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  "Notifications",
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 32.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 4.0, 8.0, 4.0),
                                                  child: Text(
                                                    "3",
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: InkWell(
                                      onTap: () async {
                                        context.pushNamed('user');
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.easeInOut,
                                        width: double.infinity,
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.person_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    "User",
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.easeInOut,
                                      width: double.infinity,
                                      height: 44.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.wifi_tethering_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  "Explore",
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.15,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.12,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if ((Theme.of(context).brightness ==
                                            Brightness.dark) ==
                                        false)
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.13,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.04,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setDarkModeSetting(
                                                    context, ThemeMode.light);
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.065,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.035,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Light Mode",
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setDarkModeSetting(
                                                    context, ThemeMode.dark);
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.065,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.035,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Dark Mode",
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if ((Theme.of(context).brightness ==
                                            Brightness.dark) ==
                                        true)
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.13,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.04,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setDarkModeSetting(
                                                    context, ThemeMode.light);
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.065,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.035,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Light Mode",
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setDarkModeSetting(
                                                    context, ThemeMode.dark);
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.065,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.035,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Dark Mode",
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    Divider(
                                      height: 12.0,
                                      thickness: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25.0, 12.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Logout",
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF9A0D0D),
                                                ),
                                          ),
                                          Icon(
                                            Icons.login_outlined,
                                            color: Color(0xFF9A0D0D),
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.85,
                      height: MediaQuery.sizeOf(context).height * 0.85,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).lineColor,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.52,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.17,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Center(
                                    child: Text(
                                        FFLocalizations.of(context).getText(
                                          '2we5jmrc' /* Top Level Category */,
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ))),
                              ),
                              Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.26,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.17,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(29.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.13,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.16,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.08,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.06,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Image.asset(
                                                  "assets/images/datapipeline.jpg",
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.13,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.08,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Total Pipelines",
                                                    style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 4.0),
                                                    child: Text("1",
                                                        style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.13,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.16,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.13,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.16,
                                              child: SfCartesianChart(
                                                plotAreaBorderWidth: 0,
                                                title: ChartTitle(
                                                  text: "Active user ",
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                ),
                                                primaryXAxis: CategoryAxis(
                                                    majorGridLines:
                                                        const MajorGridLines(
                                                            width: 0),
                                                    labelPlacement:
                                                        LabelPlacement.onTicks),
                                                primaryYAxis: NumericAxis(
                                                    minimum: 30,
                                                    maximum: 80,
                                                    axisLine: const AxisLine(
                                                        width: 0),
                                                    edgeLabelPlacement:
                                                        EdgeLabelPlacement
                                                            .shift,
                                                    majorTickLines:
                                                        const MajorTickLines(
                                                            size: 0)),
                                                series:
                                                    _getDefaultSplineSeries(),
                                                tooltipBehavior:
                                                    TooltipBehavior(
                                                        enable: true),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.52,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.36,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.49,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.3,
                                    child: SfCartesianChart(
                                        title: ChartTitle(
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                            text: "Latest data update"),
                                        tooltipBehavior: TooltipBehavior(
                                          borderColor: Colors.black,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                          enable: true,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          canShowMarker: true,
                                        ),
                                        primaryXAxis: NumericAxis(
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                          majorGridLines:
                                              MajorGridLines(width: 0),
                                          minorGridLines:
                                              MinorGridLines(width: 0),
                                          majorTickLines:
                                              MajorTickLines(size: 0),
                                          minorTickLines:
                                              MinorTickLines(size: 0),
                                        ),
                                        primaryYAxis: NumericAxis(
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                          majorGridLines:
                                              MajorGridLines(width: 0),
                                          minorGridLines:
                                              MinorGridLines(width: 0),
                                          majorTickLines:
                                              MajorTickLines(size: 0),
                                          minorTickLines:
                                              MinorTickLines(size: 0),
                                        ),
                                        series: <SplineSeries<ChartSampleData,
                                            num>>[
                                          SplineSeries<ChartSampleData, num>(
                                              enableTooltip: true,
                                              legendIconType:
                                                  LegendIconType.rectangle,
                                              dataSource: chartData!,
                                              color: const Color.fromRGBO(
                                                  140, 198, 64, 1),
                                              width: 2,
                                              xValueMapper:
                                                  (ChartSampleData sales, _) =>
                                                      sales.x as num,
                                              yValueMapper:
                                                  (ChartSampleData sales, _) =>
                                                      sales.y,
                                              markerSettings:
                                                  const MarkerSettings(
                                                      isVisible: true),
                                              name: 'Commodities',
                                              dataLabelSettings:
                                                  DataLabelSettings(
                                                isVisible: true,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                alignment: _chartAlignment!,
                                                labelAlignment: _labelPosition!,
                                                offset: Offset(
                                                    _horizontalPaddding,
                                                    _verticalPaddding),
                                              )),
                                          SplineSeries<ChartSampleData, num>(
                                              legendIconType:
                                                  LegendIconType.rectangle,
                                              color: const Color.fromRGBO(
                                                  0, 160, 245, 0.8),
                                              dataSource: chartData!,
                                              width: 2,
                                              xValueMapper:
                                                  (ChartSampleData sales, _) =>
                                                      sales.x as num,
                                              yValueMapper:
                                                  (ChartSampleData sales, _) =>
                                                      sales.yValue,
                                              markerSettings:
                                                  const MarkerSettings(
                                                      isVisible: true),
                                              name: 'Health',
                                              dataLabelSettings:
                                                  DataLabelSettings(
                                                isVisible: true,
                                                useSeriesColor: _seriescolor,
                                                alignment: _chartAlignment!,
                                                labelAlignment: _labelPosition!,
                                                offset: Offset(
                                                    _horizontalPaddding,
                                                    _verticalPaddding),
                                              ))
                                        ]),
                                  )),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.26,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.36,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.26,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.16,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.26,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.16,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.25,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.26,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(29.0),
                                ),
                                child: SfCircularChart(
                                  tooltipBehavior: TooltipBehavior(
                                    enable: true,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                  ),
                                  title: ChartTitle(
                                    text: "Top updated categories",
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                  ),
                                  series: _getRadiusPieSeries(),
                                  onTooltipRender: (TooltipArgs args) {
                                    final NumberFormat format =
                                        NumberFormat.decimalPattern();
                                    args.text = args
                                            .dataPoints![
                                                args.pointIndex!.toInt()]
                                            .x
                                            .toString() +
                                        ' : ' +
                                        format.format(args
                                            .dataPoints![
                                                args.pointIndex!.toInt()]
                                            .y);
                                  },
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.25,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.26,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(29.0),
                                ),
                                child: SfCircularChart(
                                  title: ChartTitle(
                                      text: isCardView
                                          ? ''
                                          : 'Electricity sectors'),
                                  series: _getGroupingPieSeries(),
                                  tooltipBehavior: _tooltipBehavior,
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.26,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.26,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(29.0),
                                ),
                                child: SfCartesianChart(
                                  plotAreaBorderWidth: 0,
                                  title: ChartTitle(
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                      text: "Activity"),
                                  primaryXAxis: CategoryAxis(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                    majorGridLines:
                                        const MajorGridLines(width: 0),
                                  ),
                                  primaryYAxis: NumericAxis(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                      axisLine: const AxisLine(width: 0),
                                      majorTickLines:
                                          const MajorTickLines(size: 0)),
                                  series: _getDefaultColumnSeries(),
                                  tooltipBehavior: _tooltipBehavior,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<SplineSeries<ChartSampleData, String>> _getDefaultSplineSeries() {
    return <SplineSeries<ChartSampleData, String>>[
      SplineSeries<ChartSampleData, String>(
        dataLabelSettings: DataLabelSettings(
          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
        ),
        dataSource: newchartData!,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        markerSettings: const MarkerSettings(isVisible: true),
        name: 'High',
      ),
      SplineSeries<ChartSampleData, String>(
        dataLabelSettings: DataLabelSettings(
          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
        ),
        dataSource: newchartData!,
        name: 'Low',
        markerSettings: const MarkerSettings(isVisible: true),
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
      )
    ];
  }

  List<PieSeries<ChartSampleData, String>> _getGroupingPieSeries() {
    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
          radius: '90%',
          dataLabelMapper: (ChartSampleData data, _) => data.x as String,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
          ),
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'Finance & Banking', y: 57, text: '57 Datasets'),
            ChartSampleData(x: 'Economics', y: 43, text: '43 Datasets'),
            ChartSampleData(x: 'Demographics', y: 64, text: '64 Datasets'),
            ChartSampleData(x: 'Environment', y: 12, text: '12 Datasets'),
            ChartSampleData(x: 'Health', y: 37, text: '37 Datasets'),
            ChartSampleData(
                x: 'Education',
                y: 27,
                text: ('27 Datasets'),
                pointColor: const Color.fromRGBO(198, 201, 207, 1)),
            ChartSampleData(
              x: 'Crima & Public Safety',
              y: 28,
              text: ('28 Datasets'),
              pointColor: const Color.fromRGBO(200, 34, 50, 1),
            ),
            ChartSampleData(
              x: 'Infrastructure & Transportation',
              y: 30,
              text: ('30 Datasets'),
              pointColor: const Color.fromRGBO(87, 115, 230, 1),
            ),
            ChartSampleData(
              x: 'Geospatial Data',
              y: 24,
              text: ('24 Datasets'),
              pointColor: const Color.fromRGBO(32, 182, 55, 1),
            ),
            ChartSampleData(
              x: 'Culture & Society',
              y: 31,
              text: ('31 Datasets'),
              pointColor: const Color.fromRGBO(108, 50, 123, 1),
            ),
            ChartSampleData(
              x: 'Science & Technology',
              y: 25,
              text: ('25 Datasets'),
              pointColor: const Color.fromRGBO(244, 204, 27, 1),
            ),
            ChartSampleData(
              x: 'Agriculture & Food',
              y: 26,
              text: ('26 Datasets'),
              pointColor: const Color.fromRGBO(143, 255, 0, 1),
            ),
            ChartSampleData(
              x: 'Energy',
              y: 27,
              text: ('27 Datasets'),
              pointColor: const Color.fromRGBO(195, 24, 91, 1),
            ),
            ChartSampleData(
                x: 'Weather & Climate',
                y: 23,
                text: ('23 Datasets'),
                pointColor: const Color.fromRGBO(198, 201, 207, 1)),
            ChartSampleData(
              x: 'Urban Planning & Development',
              y: 23,
              text: ('23 Datasets'),
              pointColor: const Color.fromRGBO(10, 65, 134, 1),
            ),
            ChartSampleData(
              x: 'International Relations & Trade',
              y: 29,
              text: ('29 Datasets'),
              pointColor: const Color.fromRGBO(254, 145, 78, 1),
            ),
            ChartSampleData(
              x: 'Media & Communication',
              y: 27,
              text: ('27 Datasets'),
              pointColor: const Color.fromRGBO(58, 190, 155, 1),
            ),
            ChartSampleData(
              x: 'Tourism & Travel',
              y: 24,
              text: ('24 Datasets'),
              pointColor: const Color.fromRGBO(16, 205, 222, 1),
            ),
            ChartSampleData(
              x: 'Sports & Recreation',
              y: 27,
              text: ('27 Datasets'),
              pointColor: const Color.fromRGBO(230, 45, 12, 1),
            ),
            ChartSampleData(
              x: 'Arts & Culture',
              y: 27,
              text: ('27 Datasets'),
              pointColor: const Color.fromRGBO(132, 78, 159, 1),
            )
          ],
          startAngle: 90,
          endAngle: 90,

          /// To enable and specify the group mode for pie chart.
          groupMode: CircularChartGroupMode.value,
          groupTo: 7,
          pointColorMapper: (ChartSampleData data, _) => data.pointColor,
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y)
    ];
  }

  List<ColumnSeries<ChartSampleData, String>> _getDefaultColumnSeries() {
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        width: 0.2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
        dataSource: <ChartSampleData>[
          ChartSampleData(x: 'Mon', y: 185),
          ChartSampleData(x: 'Tue', y: 255),
          ChartSampleData(x: 'Wed', y: 204),
          ChartSampleData(x: 'Thu', y: 151),
          ChartSampleData(x: 'Fri', y: 177),
          ChartSampleData(x: 'Sat', y: 43),
          ChartSampleData(x: 'Sun', y: 36),
        ],
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        dataLabelSettings: DataLabelSettings(
          textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
          isVisible: true,
        ),
      )
    ];
  }

  List<PieSeries<ChartSampleData, String>> _getRadiusPieSeries() {
    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
          radius: "200%",
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'Finance & Banking', y: 57, text: '57'),
            ChartSampleData(x: 'Weather', y: 23, text: '23'),
            ChartSampleData(x: 'Health', y: 37, text: '37'),
            ChartSampleData(x: 'Economics', y: 43, text: '43'),
            ChartSampleData(x: 'Transportation', y: 26, text: '26'),
            ChartSampleData(x: 'Education', y: 17, text: '27'),
            ChartSampleData(x: 'Demographics', y: 64, text: '44')
          ],
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.x as String,
          startAngle: 100,
          endAngle: 100,
          pointRadiusMapper: (ChartSampleData data, _) => data.text,
          dataLabelSettings: DataLabelSettings(
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
              isVisible: true,
              labelPosition: ChartDataLabelPosition.outside))
    ];
  }

  void showDropdownNotificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          content: Dropdown05NotificationsWidget(),
        );
      },
    );
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData('Mon', 10, 5),
      SalesData('Tue', 15, 8),
      SalesData('Wed', 20, 12),
      SalesData('Thu', 8, 4),
      SalesData('Fri', 25, 10),
      SalesData('Sat', 22, 10),
      SalesData('Sun', 30, 15),
    ];
    return chartData;
  }

  void _onAlignmentChange(String item) {
    _labelAln = item;
    if (_labelAln == 'far') {
      _chartAlignment = ChartAlignment.far;
    } else if (_labelAln == 'center') {
      _chartAlignment = ChartAlignment.center;
    } else if (_labelAln == 'near') {
      _chartAlignment = ChartAlignment.near;
    }
    setState(() {});
  }

  void _onPositionChange(String item) {
    _labelPos = item;
    if (_labelPos == 'top') {
      _labelPosition = ChartDataLabelAlignment.top;
    } else if (_labelPos == 'outer') {
      _labelPosition = ChartDataLabelAlignment.outer;
    } else if (_labelPos == 'bottom') {
      _labelPosition = ChartDataLabelAlignment.bottom;
    } else if (_labelPos == 'middle') {
      _labelPosition = ChartDataLabelAlignment.middle;
    }
    setState(() {});
  }
}

class SalesData {
  SalesData(this.year, this.sales1, this.sales2);
  final String year;
  final double sales1;
  final double sales2;
}
