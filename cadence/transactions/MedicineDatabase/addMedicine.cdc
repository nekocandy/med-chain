import MedicineDatabase from 0xNC

transaction(
    medicine_id: String,
    name: String,
    price: Int,
    quantity: Int,
) {
    prepare(account:AuthAccount) {
    }

    execute {
        MedicineDatabase.addMedicine(medicine_id: medicine_id, name: name, price: price, quantity: quantity)
    }
}