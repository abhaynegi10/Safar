


import 'package:safar/models/activity_model.dart';

class Destination {
 final String imageUrl;
 final String city;
 final String country;
 final String description;
 final List<Activity> activities;

  Destination({
   required this.imageUrl,
   required this.city,
   required this.country,
   required this.description,
   required this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/images/clocktower.jpg',
    name: 'Clock Tower',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 3,
    price: 0,
  ),
  Activity(
    imageUrl: 'assets/images/sunrise.jpg',
    name: 'Sunrise and Sunset point',
    type: 'Sightseeing Tour',
    startTimes: ['5:30 am', '6:30 pm'],
    rating: 5,
    price: 0,
  ),
  Activity(
    imageUrl: 'assets/images/lakefront.jpg',
    name: 'Lakefront',
    type: 'Sightseeing Tour',
    startTimes: ['10:00 am', '9:00 pm'],
    rating: 4,
    price: 0,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/lucknow.jpg',
    city: 'Lucknow',
    country: 'India',
    description: 'Visit Lucknow for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/nagpur.jpg',
    city: 'Nagpur',
    country: 'India',
    description: 'Visit Nagpur for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/jaipur.jpg',
    city: 'Jaipur',
    country: 'India',
    description: 'Visit Jaipur for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/dehradun.jpg',
    city: 'Dehradun',
    country: 'India',
    description: 'Visit Dehradun for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/kashmir.jpg',
    city: 'Kashmir',
    country: 'India',
    description: 'Visit Jammu and Kashmir for an amazing and unforgettable adventure.',
    activities: activities,
  ),
];
