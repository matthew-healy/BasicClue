struct DateViewModel: Equatable, Codable {
    let day: String
    let isSelected: Bool

    static func ==(lhs: DateViewModel, rhs: DateViewModel) -> Bool {
        return lhs.day == rhs.day && lhs.isSelected == rhs.isSelected
    }
}
