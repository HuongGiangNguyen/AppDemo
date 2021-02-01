class SettingModel {
  PaymentMethods paymentMethods;
  PaymentMethods feeShopee;

  SettingModel({this.paymentMethods, this.feeShopee});

  SettingModel.fromJson(Map<String, dynamic> json) {
    paymentMethods = json['payment_methods'] != null ? new PaymentMethods.fromJson(json['payment_methods']) : null;
    feeShopee = json['fee_shopee'] != null ? new PaymentMethods.fromJson(json['fee_shopee']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paymentMethods != null) {
      data['payment_methods'] = this.paymentMethods.toJson();
    }
    if (this.feeShopee != null) {
      data['fee_shopee'] = this.feeShopee.toJson();
    }
    return data;
  }
}

class PaymentMethods {
  PaymentMethods();
  Map<String, dynamic> json;
  PaymentMethods.fromJson(Map<String, dynamic> json) {
    this.json = json;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return json;
  }
}

class ApiFailed {
  String message;
  Errors errors;

  ApiFailed({this.message, this.errors});

  ApiFailed.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors = json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors.toJson();
    }
    return data;
  }
}

class Errors {
  Errors();

  Errors.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
