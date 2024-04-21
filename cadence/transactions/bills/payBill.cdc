import BillDatabase from 0xNC

transaction(
    bill_id: String,
    txn_id: String
) {
    prepare(account:AuthAccount) {
    }

    execute {
        BillDatabase.pay_bill(bill_id: bill_id, txn_id: txn_id)
    }
}