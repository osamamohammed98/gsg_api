class Product {
  List<String> colors;
  String currancy;
  List<String> attachments;
  List<String> categoryId;
  List subCategoryId;
  String country;
  List<String> size;
  String sId;
  String name;
  String description;
  int price;
  String weightOfProduct;
  String quantity;
  double productPrice;
  String productStatus;
  String userId;
  String createdAt;
  String updatedAt;
  int iV;

  Product(
      {this.colors,
      this.currancy,
      this.attachments,
      this.categoryId,
      this.subCategoryId,
      this.country,
      this.size,
      this.sId,
      this.name,
      this.description,
      this.price,
      this.weightOfProduct,
      this.quantity,
      this.productPrice,
      this.productStatus,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    colors = json['colors'].cast<String>();
    currancy = json['currancy'];
    attachments = json['attachments'].cast<String>();
    categoryId = json['categoryId'].cast<String>();
    subCategoryId = json['subCategoryId'] ?? null;
    country = json['country'];
    size = json['size'].cast<String>();
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    weightOfProduct = json['weightOfProduct'];
    quantity = json['quantity'];
    productPrice = json['productPrice'];
    productStatus = json['productStatus'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['colors'] = this.colors;
    data['currancy'] = this.currancy;
    data['attachments'] = this.attachments;
    data['categoryId'] = this.categoryId;
    data['country'] = this.country;
    data['size'] = this.size;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['weightOfProduct'] = this.weightOfProduct;
    data['quantity'] = this.quantity;
    data['productPrice'] = this.productPrice;
    data['productStatus'] = this.productStatus;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
