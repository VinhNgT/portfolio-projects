enum License {
  all('assets/icons/home_screen/compiled/danger_fire.svg.vec'),
  a1('assets/icons/vehicles/compiled/motorbike-1.svg.vec'),
  a2('assets/icons/vehicles/compiled/motorbike-2.svg.vec'),
  a3('assets/icons/vehicles/compiled/motorbike-scooter.svg.vec'),
  a4('assets/icons/vehicles/compiled/loader-truck.svg.vec'),
  b1('assets/icons/vehicles/compiled/car.svg.vec'),
  b2('assets/icons/vehicles/compiled/taxi.svg.vec');

  const License(this.iconAssetPath);
  final String iconAssetPath;
}
