class WalletTransaction {
  final int srNo;
  final String date;
  final String particulars;
  final double amount;
  final String approvedDate;

  WalletTransaction({
    required this.srNo,
    required this.date,
    required this.particulars,
    required this.amount,
    required this.approvedDate,
  });

  factory WalletTransaction.fromJson(Map<String, dynamic> json, int index) {
    return WalletTransaction(
      srNo: index + 1,
      date: json['date'],
      particulars: json['particulars'],
      amount: double.parse(json['amount'].toString()),
      approvedDate: json['approvedDate'],
    );
  }
}
