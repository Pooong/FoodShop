import 'package:geocoding/geocoding.dart';

class Place {
  final String? name;
  final String? street;
  final String? locality;
  final String? subLocality;
  final String? administrativeArea;
  final String? subAdministrativeArea;
  final String? postalCode;
  final String? country;
  final String? isoCountryCode;
  final double? latitude;
  final double? longitude;

  Place({
    this.name,
    this.street,
    this.locality,
    this.subLocality,
    this.administrativeArea,
    this.subAdministrativeArea,
    this.postalCode,
    this.country,
    this.isoCountryCode,
    this.latitude,
    this.longitude,
  });

  factory Place.fromPlacemarkAndLocation(
      Placemark placemark, Location location) {
    return Place(
      name: placemark.name,
      street: placemark.street,
      locality: placemark.locality,
      subLocality: placemark.subLocality,
      administrativeArea: placemark.administrativeArea,
      subAdministrativeArea: placemark.subAdministrativeArea,
      postalCode: placemark.postalCode,
      country: placemark.country,
      isoCountryCode: placemark.isoCountryCode,
      latitude: location.latitude,
      longitude: location.longitude,
    );
  }
  String displayAddress() {
    List<String> addressParts = [];

    if (name != null && name!.isNotEmpty) addressParts.add(name!);
    if (street != null && street!.isNotEmpty) addressParts.add(street!);
    // if (locality != null && locality!.isNotEmpty) addressParts.add(locality!);
    // if (administrativeArea != null && administrativeArea!.isNotEmpty)
    //   addressParts.add(administrativeArea!);
    if (country != null && country!.isNotEmpty) addressParts.add(country!);

    return addressParts.join(', ');
  }
}
