module BookingUpForBeauty

open System

let schedule appointmentDateDescription = DateTime.Parse(appointmentDateDescription)

let hasPassed appointmentDate = appointmentDate < DateTime.Now

let isAfternoonAppointment (appointmentDate: DateTime) = appointmentDate.Hour >= 12 && appointmentDate.Hour < 18

let description appointmentDate = $"You have an appointment on {appointmentDate}."

let anniversaryDate() = DateTime(DateTime.Now.Year, 9, 15, 0, 0, 0)
