import BillDatabase from 0xNC

transaction(
    bill_id: String,
    bill_name: String,
    email: String,
    expense: String,
    amount: Int,
) {
    prepare(account:AuthAccount) {
    }

    execute {
        BillDatabase.add_bill(
            bill_id: bill_id, expense: expense, bill_name: bill_name, amount: amount, email: email
        )
    }
}