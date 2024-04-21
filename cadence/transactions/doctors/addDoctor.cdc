import Doctors from 0xNC

transaction(
    doctor_id: String, 
    name: String, 
    specialty: String
) {
    prepare(account: AuthAccount) { }

    execute {
        Doctors.add_doctor(doctor_id: doctor_id, name: name, specialty: specialty)
    }
}