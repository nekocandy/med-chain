pub contract MedicineDatabase {
   pub struct Medicine {
      pub let id: String
      pub let name: String
      pub(set) var price: Int
      pub(set) var quantity: Int

      init(id: String, name: String, price: Int, quantity: Int) {
         self.id = id
         self.name = name
         self.price = price
         self.quantity = quantity
      }
   }

   // Medicine ID: Medicine
   pub var medicines: {String: Medicine}

   init() {
      self.medicines = {}
   }

   pub fun addMedicine(id: String, name: String, price: Int, quantity: Int) {
      let newMedicine = Medicine(id: id, name: name, price: price, quantity: quantity)
      self.medicines[name] = newMedicine
   }

   pub fun getMedicine(id: String): Medicine? {
      return self.medicines[id]
   }

   pub fun getAllMedicines(): [Medicine] {
      return self.medicines.values
   }

   pub fun updateMedicinePrice(id: String, newPrice: Int) {
      if let medicine = self.medicines[id] {
         medicine.price = newPrice
      }
   }

   pub fun updateMedicineQuantity(id: String, newQuantity: Int) {
      if let medicine = self.medicines[id] {
         medicine.quantity = newQuantity
      }
   }

   pub fun removeMedicine(id: String) {
      self.medicines.remove(key: id)
   }
}