import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';

typedef OnPlaceSelected = void Function(Prediction prediction);

Widget locationSearchTextField({
  required TextEditingController controller,
  required OnPlaceSelected onPlaceSelected,
}) {
  final apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';

  return GooglePlaceAutoCompleteTextField(
    textEditingController: controller,
    googleAPIKey: apiKey,
    inputDecoration: const InputDecoration(
      hintText: 'Search location...',
      border: InputBorder.none,
    ),
    debounceTime: 800,
    countries: ["in", "fr"],
    isLatLngRequired: true,
    getPlaceDetailWithLatLng: (Prediction prediction) {
      onPlaceSelected(prediction);
    },
    itemClick: (Prediction prediction) {
      controller.text = prediction.description ?? '';
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: prediction.description?.length ?? 0),
      );
    },
    itemBuilder: (context, index, Prediction prediction) {
      return Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const Icon(Icons.location_on),
            const SizedBox(width: 7),
            Expanded(child: Text(prediction.description ?? "")),
          ],
        ),
      );
    },
    isCrossBtnShown: true,
    containerHorizontalPadding: 10,
    placeType: PlaceType.geocode,
  );
}
