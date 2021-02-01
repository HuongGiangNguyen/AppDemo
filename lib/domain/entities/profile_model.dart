class ProfileModel {
  int id;
  String name;
  String facebookNickname;
  String phone;
  String avatar;
  String bankName;
  String branchName;
  String bankAccount;
  String bankOwnerAccount;
  int role;
  List<String> nicknames;
  int createdAt;

  ProfileModel(
      {this.id,
      this.name,
      this.facebookNickname,
      this.phone,
      this.avatar,
      this.bankName,
      this.branchName,
      this.bankAccount,
      this.bankOwnerAccount,
      this.role,
      this.nicknames,
      this.createdAt});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    facebookNickname = json['facebook_nickname'];
    phone = json['phone'];
    avatar = json['avatar'];
    bankName = json['bank_name'];
    branchName = json['branch_name'];
    bankAccount = json['bank_account'];
    bankOwnerAccount = json['bank_owner_account'];
    role = json['role'];
    nicknames = json['nicknames'].cast<String>();
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['facebook_nickname'] = this.facebookNickname;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['bank_name'] = this.bankName;
    data['branch_name'] = this.branchName;
    data['bank_account'] = this.bankAccount;
    data['bank_owner_account'] = this.bankOwnerAccount;
    data['role'] = this.role;
    data['nicknames'] = this.nicknames;
    data['created_at'] = this.createdAt;
    return data;
  }
}
