import 'package:covid_tracker/components/stats_container_comp.dart';
import 'package:covid_tracker/features/vaccination-stats/vaccination_view_model.dart';
import 'package:covid_tracker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

void main() => runApp(const VaccinationView());

const snackBar = SnackBar(content: Text(Constants.covidLocation));

class VaccinationView extends StatefulWidget {
  const VaccinationView({Key? key}) : super(key: key);

  @override
  _VaccinationViewState createState() => _VaccinationViewState();
}

class _VaccinationViewState extends State<VaccinationView> {
  late GoogleMapController mapController;

  final LatLng _location = const LatLng(0, 0);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VaccinationViewModel>(
      create: (_) => VaccinationViewModel(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          systemOverlayStyle: Constants.statusBarColor,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Consumer<VaccinationViewModel>(builder: (_, notifier, __) {
          return GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _location,
            ),
            onTap: (LatLng latLng) async {
              await notifier.onTap(latLng);
              if (notifier.status) {
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 120,
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              notifier.vaccinationResponse!.country,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                StatsContainerComp(
                                    placeholder: Constants.covidTotal,
                                    boxColor: Colors.blueAccent,
                                    textColor: Colors.white,
                                    value: notifier.vaccinationResponse!
                                        .timeline[0].total),
                                StatsContainerComp(
                                    placeholder:
                                        "Doses on ${notifier.vaccinationResponse!.timeline[0].date}",
                                    boxColor: Colors.green,
                                    textColor: Colors.white,
                                    value: notifier.vaccinationResponse!
                                        .timeline[0].daily),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
            markers: notifier.markers,
          );
        }),
      ),
    );
  }
}
