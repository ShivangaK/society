class Receipts {
  int? tRANSACTIONID;
  int? mEMBERSHIPID;
  String? tRANSACTIONTYPE;
  DateTime? tRANSACTIONDATE;
  double? aMOUNT;
  String? dESCRIPTION;
  String? sTATUS;
  String? rEFERENCENUMBER;
  String? pAYMENTMODE;
  String? pAYMENTTYPE;
  int? pROJECTCODE;
  int? uPDATEDBY;
  String? fROMACCOUNT;
  int? sENIORITY;
  int? iNSTALLMENTNO;
  String? tOACCOUNT;
  String? rECEIPT_URL;

  Receipts(
      {this.tRANSACTIONID,
      this.mEMBERSHIPID,
      this.tRANSACTIONTYPE,
      this.tRANSACTIONDATE,
      this.aMOUNT,
      this.dESCRIPTION,
      this.sTATUS,
      this.rEFERENCENUMBER,
      this.pAYMENTMODE,
      this.pAYMENTTYPE,
      this.pROJECTCODE,
      this.uPDATEDBY,
      this.fROMACCOUNT,
      this.sENIORITY,
      this.iNSTALLMENTNO,
      this.tOACCOUNT,
      this.rECEIPT_URL});

  Receipts.fromJson(Map<String, dynamic> json) {
    tRANSACTIONID = json['TRANSACTIONID'];
    mEMBERSHIPID = json['MEMBERSHIPID'];
    tRANSACTIONTYPE = json['TRANSACTION_TYPE'];
    tRANSACTIONDATE = DateTime.parse(json['TRANSACTION_DATE']);
    aMOUNT = json['AMOUNT'];
    dESCRIPTION = json['DESCRIPTION'];
    sTATUS = json['STATUS'];
    rEFERENCENUMBER = json['REFERENCE_NUMBER'];
    pAYMENTMODE = json['PAYMENT_MODE'];
    pAYMENTTYPE = json['PAYMENT_TYPE'];
    pROJECTCODE = json['PROJECT_CODE'];
    uPDATEDBY = json['UPDATED_BY'];
    fROMACCOUNT = json['FROM_ACCOUNT'];
    sENIORITY = json['SENIORITY'];
    iNSTALLMENTNO = json['INSTALLMENT_NO'];
    tOACCOUNT = json['TO_ACCOUNT'];
    rECEIPT_URL = json['RECEIPT_URL'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['TRANSACTIONID'] = tRANSACTIONID.toString();
    data['MEMBERSHIPID'] = mEMBERSHIPID.toString();
    data['TRANSACTION_TYPE'] = tRANSACTIONTYPE;
    data['TRANSACTION_DATE'] = tRANSACTIONDATE?.toIso8601String();
    data['AMOUNT'] = aMOUNT?.toString();
    data['DESCRIPTION'] = dESCRIPTION;
    data['STATUS'] = sTATUS;
    data['REFERENCE_NUMBER'] = rEFERENCENUMBER;
    data['PAYMENT_MODE'] = pAYMENTMODE;
    data['PAYMENT_TYPE'] = pAYMENTTYPE;
    data['PROJECT_CODE'] = pROJECTCODE.toString();
    data['UPDATED_BY'] = uPDATEDBY;
    data['FROM_ACCOUNT'] = fROMACCOUNT;
    data['SENIORITY'] = sENIORITY;
    data['INSTALLMENT_NO'] = iNSTALLMENTNO;
    data['TO_ACCOUNT'] = tOACCOUNT;
    data['RECEIPT_URL'] = rECEIPT_URL;
    return data;
  }

  // User Defined
  List<Receipts> parseReceipts(List<dynamic> str) {
    // print('Inside Parse Receipts');

    return List<Receipts>.from(str.map((x) => Receipts.fromJson(x)));
  }
}
