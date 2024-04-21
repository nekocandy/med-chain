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

export interface BillData {
  bill_id: string
  bill_name: string
  expense: string
  amount: string
  email: string
  paid: boolean
  paid_txn_id: null | string
}
