

class Address {
  String? address;

  String? state;


  String? country;

  Address({
    this.address,
    this.state,



    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json['address'] as String?,
        state: json['state'] as String?,
        country: json['country'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'address': address,
        'state': state,
        'country': country,
      };
}
