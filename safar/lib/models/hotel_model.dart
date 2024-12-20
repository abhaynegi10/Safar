class Hotel {
 final String imageUrl;
 final String name;
 final String address;
 final int price;

  Hotel({
   required this.imageUrl,
   required this.name,
   required this.address,
   required this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/rad.jpg',
    name: 'Radisson blu',
    address: 'Cantonment Road',
    price: 75,
  ),
  Hotel(
    imageUrl: 'assets/images/hyat.jpg',
    name: 'Taj',
    address: 'Gomti Nagar',
    price: 107,
  ),
  Hotel(
    imageUrl: 'assets/images/taj.jpg',
    name: 'Hyatt Regency',
    address: 'VIP Road',
    price: 93,
  ),
];