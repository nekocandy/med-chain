pub contract MedicineDatabase {
   pub struct Medicine {
      pub let medicine_id: String
      pub let name: String
      pub(set) var price: Int
      pub(set) var quantity: Int

      init(medicine_id: String, name: String, price: Int, quantity: Int) {
         self.medicine_id = medicine_id
         self.name = name
         self.price = price
         self.quantity = quantity
      }
   }

   // Medicine medicine_id: Medicine
   pub var medicines: {String: Medicine}

   init() {
      self.medicines = {}
   }

   pub fun addMedicine(medicine_id: String, name: String, price: Int, quantity: Int) {
      let newMedicine = Medicine(medicine_id: medicine_id, name: name, price: price, quantity: quantity)
      self.medicines[name] = newMedicine
   }

   pub fun getMedicine(medicine_id: String): Medicine? {
      return self.medicines[medicine_id]
   }

   pub fun getAllMedicines(): [Medicine] {
      return self.medicines.values
   }

   pub fun updateMedicinePrice(medicine_id: String, newPrice: Int) {
      if let medicine = self.medicines[medicine_id] {
         medicine.price = newPrice
      }
   }

   pub fun updateMedicineQuantity(medicine_id: String, newQuantity: Int) {
      if let medicine = self.medicines[medicine_id] {
         medicine.quantity = newQuantity
      }
   }

   pub fun removeMedicine(medicine_id: String) {
      self.medicines.remove(key: medicine_id)
   }
}