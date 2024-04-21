import DoctorReviews from 0xdefault

transaction(
    doctor: String,
    review: String,
    reviewer: Address
) {
    prepare(account: AuthAccount) { }

    execute {
        DoctorReviews.addReview(doctor: doctor, review: review, reviewer: reviewer)
    }
}