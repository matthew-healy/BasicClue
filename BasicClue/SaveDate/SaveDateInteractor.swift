class SaveDateInteractor: SaveDateInteracting {
    private let dataStore: DataStoring

    init(dataStore: DataStoring) {
        self.dataStore = dataStore
    }

    func saveDate(_ date: Int) {
        let fullDate = "January \(date)"
        let dateList = dataStore.getDateList()
        guard !dateList.contains(fullDate) else { return }
        dataStore.appendToDateList(newDate: fullDate)
    }
}
