pub contract Doctors {
    pub struct Doctor {
        pub let doctor_id: String
        pub let name: String
        pub let specialty: String

        init(doctor_id: String, name: String, specialty: String) {
            self.doctor_id = doctor_id
            self.name = name
            self.specialty = specialty
        }
    }

    pub var doctors: [Doctor]

    init() {
        self.doctors = []
    }

    pub fun add_doctor(doctor_id: String, name: String, specialty: String) {
        let doctor = Doctor(doctor_id: doctor_id, name: name, specialty: specialty)
        self.doctors.append(doctor)
    }

    pub fun get_doctor(doctor_id: String): Doctor? {
        for doctor in self.doctors {
            if doctor.doctor_id == doctor_id {
                return doctor
            }
        }
        return nil
    }

    pub fun get_doctors(): [Doctor] {
        return self.doctors
    }
}