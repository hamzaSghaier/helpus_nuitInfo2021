class ImageSlide {
  String name;
  String imageurl;

  ImageSlide({this.name, this.imageurl});

  ImageSlide.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageurl = json['imageurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['imageurl'] = this.imageurl;
    return data;
  }
}