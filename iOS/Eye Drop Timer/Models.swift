import Foundation

struct DoseItem: Identifiable, Codable, Equatable {
    var id: UUID
    var dateAdded: Date
    var prescriptionName: String
    var eye: String
    var timeApplied: String
    var notes: String

    init(id: UUID = UUID(), dateAdded: Date = Date(), prescriptionName: String, eye: String, timeApplied: String, notes: String) {
        self.id = id
        self.dateAdded = dateAdded
        self.prescriptionName = prescriptionName
        self.eye = eye
        self.timeApplied = timeApplied
        self.notes = notes
    }

    static func blank() -> DoseItem {
        DoseItem(prescriptionName: "", eye: "", timeApplied: "", notes: "")
    }
}
