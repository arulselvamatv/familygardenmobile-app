class CheckoutConfirmModel {
  Payment? payment;
  String? logged;

  CheckoutConfirmModel({this.payment, this.logged});

  CheckoutConfirmModel.fromJson(Map<String, dynamic> json) {
    payment =
    json['payment'] != null ? new Payment.fromJson(json['payment']) : null;
    logged = json['logged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.payment != null) {
      data['payment'] = this.payment!.toJson();
    }
    data['logged'] = this.logged;
    return data;
  }
}

class Payment {
  String? buttonConfirm;
  String? accessCode;
  String? action;
  String? tclink;
  String? policylink;
  String? encRequest;

  Payment(
      {this.buttonConfirm,
        this.accessCode,
        this.action,
        this.tclink,
        this.policylink,
        this.encRequest});

  Payment.fromJson(Map<String, dynamic> json) {
    buttonConfirm = json['button_confirm'];
    accessCode = json['access_code'];
    action = json['action'];
    tclink = json['tclink'];
    policylink = json['policylink'];
    encRequest = json['encRequest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['button_confirm'] = this.buttonConfirm;
    data['access_code'] = this.accessCode;
    data['action'] = this.action;
    data['tclink'] = this.tclink;
    data['policylink'] = this.policylink;
    data['encRequest'] = this.encRequest;
    return data;
  }
}
