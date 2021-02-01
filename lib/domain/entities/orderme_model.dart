class OrderMeModel {
  int id;
  Shop shop;
  User user;
  String orderNo;
  String waybillCode;
  String orderDate;
  String nickname;
  String paymentMethod;
  int status;
  String note;
  String transferredAt;
  String transferNote;
  String erroredAt;
  String errorNote;
  String fee;
  String feeExtra;
  String shopDiscount;
  String packingFee;
  String groupFee;
  String total;
  String realTotal;
  String remainTotal;
  String voucher;
  String feeShipping;
  String coinMoney;
  int del;
  List<Details> details;

  OrderMeModel(
      {this.id,
      this.shop,
      this.user,
      this.orderNo,
      this.waybillCode,
      this.orderDate,
      this.nickname,
      this.paymentMethod,
      this.status,
      this.note,
      this.transferredAt,
      this.transferNote,
      this.erroredAt,
      this.errorNote,
      this.fee,
      this.feeExtra,
      this.shopDiscount,
      this.packingFee,
      this.groupFee,
      this.total,
      this.realTotal,
      this.remainTotal,
      this.voucher,
      this.feeShipping,
      this.coinMoney,
      this.del,
      this.details});

  OrderMeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    orderNo = json['order_no'];
    waybillCode = json['waybill_code'];
    orderDate = json['order_date'];
    nickname = json['nickname'];
    paymentMethod = json['payment_method'];
    status = json['status'];
    note = json['note'];
    transferredAt = json['transferred_at'];
    transferNote = json['transfer_note'];
    erroredAt = json['errored_at'];
    errorNote = json['error_note'];
    fee = json['fee'];
    feeExtra = json['fee_extra'];
    shopDiscount = json['shop_discount'];
    packingFee = json['packing_fee'];
    groupFee = json['group_fee'];
    total = json['total'];
    realTotal = json['real_total'];
    remainTotal = json['remain_total'];
    voucher = json['voucher'];
    feeShipping = json['fee_shipping'];
    coinMoney = json['coin_money'];
    del = json['del'];
    if (json['details'] != null) {
      details = new List<Details>();
      json['details'].forEach((v) {
        details.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.shop != null) {
      data['shop'] = this.shop.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['order_no'] = this.orderNo;
    data['waybill_code'] = this.waybillCode;
    data['order_date'] = this.orderDate;
    data['nickname'] = this.nickname;
    data['payment_method'] = this.paymentMethod;
    data['status'] = this.status;
    data['note'] = this.note;
    data['transferred_at'] = this.transferredAt;
    data['transfer_note'] = this.transferNote;
    data['errored_at'] = this.erroredAt;
    data['error_note'] = this.errorNote;
    data['fee'] = this.fee;
    data['fee_extra'] = this.feeExtra;
    data['shop_discount'] = this.shopDiscount;
    data['packing_fee'] = this.packingFee;
    data['group_fee'] = this.groupFee;
    data['total'] = this.total;
    data['real_total'] = this.realTotal;
    data['remain_total'] = this.remainTotal;
    data['voucher'] = this.voucher;
    data['fee_shipping'] = this.feeShipping;
    data['coin_money'] = this.coinMoney;
    data['del'] = this.del;
    if (this.details != null) {
      data['details'] = this.details.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Shop {
  int id;
  String name;

  Shop({this.id, this.name});

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class User {
  int id;
  String name;
  String facebookUrl;
  String avatar;

  User({this.id, this.name, this.facebookUrl, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    facebookUrl = json['facebook_url'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['facebook_url'] = this.facebookUrl;
    data['avatar'] = this.avatar;
    return data;
  }
}

class Details {
  int id;
  String category;
  String name;
  String quantity;
  String price;

  Details({this.id, this.category, this.name, this.quantity, this.price});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    return data;
  }
}
