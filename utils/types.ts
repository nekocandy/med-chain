export interface IDoctor {
  doctor_id: string
  name: string
  specialty: string
}

export interface DoctorReviewData {
  doctor: string
  review: string
  reviewer: string
  time: string
}
