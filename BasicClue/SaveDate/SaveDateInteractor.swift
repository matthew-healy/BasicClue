class SaveDateInteractor: SaveDateInteracting {
    private let dataStore: DataStoring

    init(dataStore: DataStoring) {
        self.dataStore = dataStore
    }

    func toggleDateSelection(_ date: Int) {
        guard !isDateSelected(date) else { return }
        let fullDate = fullDateString(fromDay: date)
        dataStore.appendToDateList(newDate: fullDate)
    }

    private func fullDateString(fromDay day: Int) -> String {
        return "January \(day)"
    }

    func isDateSelected(_ date: Int) -> Bool {
        let fullDate = fullDateString(fromDay: date)
        return dataStore.getDateList().contains(fullDate)
    }
}
