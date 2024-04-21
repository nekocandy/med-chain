pub contract DoctorReviews {
    pub struct DoctorReview {
        pub let doctor: String
        pub let review: String
        pub let reviewer: Address
        pub let time: UFix64

        init(doctor: String, review: String, reviewer: Address) {
            self.doctor = doctor
            self.review = review
            self.reviewer = reviewer
            self.time = getCurrentBlock().timestamp
        }
    }

    pub let reviews: {String: [DoctorReview]}

    init() {
        self.reviews = {}
    }

    pub fun addReview(doctor: String, review: String, reviewer: Address) {
        let newReview = DoctorReview(doctor: doctor, review: review, reviewer: reviewer)

        if (self.reviews[doctor] == nil) {
            self.reviews[doctor] = [newReview]
        } else {
            self.reviews[doctor]?.append(newReview)
        }
    }

    pub fun getReviews(doctor: String): [DoctorReview]? {
        return self.reviews[doctor]
    }

    pub fun getDoctorReviews(): {String: [DoctorReview]} {
        return self.reviews
    }
}