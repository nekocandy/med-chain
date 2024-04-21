pub contract BillDatabase {
    pub struct Bill {
        pub let bill_id: String
        pub let bill_name: String
        pub let expense: String
        pub let amount: Int
        pub let email: String
        pub(set) var paid: Bool
        pub(set) var paid_txn_id: String?

        init(bill_id: String, expense: String, bill_name: String, amount: Int, email: String) {
            self.bill_id = bill_id
            self.expense = expense
            self.bill_name = bill_name
            self.amount = amount
            self.email = email
            self.paid = false
            self.paid_txn_id = nil
        }
    }

    pub let bills: {String: Bill}

    init() {
        self.bills = {}
    }

    pub fun add_bill(bill_id: String, expense: String, bill_name: String, amount: Int, email: String) {
        let bill = Bill(bill_id: bill_id, expense: expense, bill_name: bill_name, amount: amount, email: email)
        self.bills[bill_id] = bill
    }

    pub fun get_bill(bill_id: String): Bill? {
        return self.bills[bill_id]
    }

    pub fun pay_bill(bill_id: String, txn_id: String) {
        if let bill = self.bills[bill_id] {
            bill.paid = true
            bill.paid_txn_id = txn_id
        }
    }
}