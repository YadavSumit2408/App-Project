

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  String activities;

  Destination({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
    this.activities,
  });
}
//class Activity {
//  String imageUrl;
//  String name;
//  String type;
//  List<String> startTimes;
//  int rating;
//  int price;
//
//  Activity({
//    this.imageUrl,
//    this.name,
//    this.type,
//    this.startTimes,
//    this.rating,
//    this.price,
//  });
//}
//List<Activity> activities = [
//  Activity(
//    imageUrl: 'assets/images/stmarksbasilica.jpg',
//    name: 'St. Mark\'s Basilica',
//    type: 'Sightseeing Tour',
//    startTimes: ['9:00 am', '11:00 am'],
//    rating: 5,
//    price: 30,
//  ),
//  Activity(
//    imageUrl: 'assets/images/gondola.jpg',
//    name: 'Walking Tour and Gonadola Ride',
//    type: 'Sightseeing Tour',
//    startTimes: ['11:00 pm', '1:00 pm'],
//    rating: 4,
//    price: 210,
//  ),
//  Activity(
//    imageUrl: 'assets/images/murano.jpg',
//    name: 'Murano and Burano Tour',
//    type: 'Sightseeing Tour',
//    startTimes: ['12:30 pm', '2:00 pm'],
//    rating: 3,
//    price: 125,
//  ),
//];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/venice.jpg',
    city: 'Home',
    country: 'S',
    description: 'Senitize home',
    activities: 'activities',
  ),
  Destination(
    imageUrl: 'assets/images/paris.jpg',
    city: 'Villa',
    country: 'M',
    description: 'Senitize Villa',
    activities: 'activities',
  ),
  Destination(
    imageUrl: 'assets/images/newdelhi.jpg',
    city: 'Office',
    country: 'M',
    description: 'Senitize Office',
    activities: 'activities',
  ),
  Destination(
    imageUrl: 'assets/images/saopaulo.jpg',
    city: 'Factory',
    country: 'L',
    description: 'Senitize Factory',
    activities: 'activities',
  ),
  Destination(
    imageUrl: 'assets/images/newyork.jpg',
    city: 'VILLA',
    country: 'L',
    description: 'Senitize VILLA',
    activities: 'activities',
  ),
];