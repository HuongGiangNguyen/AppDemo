class ProductModel {
  int id;
  int category;
  String categoryName;
  String name;
  String shopeeLink;
  int price;
  int status;

  ProductModel({this.id, this.category, this.categoryName, this.name, this.shopeeLink, this.price, this.status});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    categoryName = json['category_name'];
    name = json['name'];
    shopeeLink = json['shopee_link'];
    price = json['price'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['category_name'] = this.categoryName;
    data['name'] = this.name;
    data['shopee_link'] = this.shopeeLink;
    data['price'] = this.price;
    data['status'] = this.status;
    return data;
  }
}
