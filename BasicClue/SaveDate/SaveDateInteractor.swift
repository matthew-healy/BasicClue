class SaveDateInteractor: SaveDateInteracting {
    private let dataStore: DataStoring

    init(dataStore: DataStoring) {
        self.dataStore = dataStore
    }

    func saveDate(_ date: Int) {
        let fullDate = "January \(date)"
        dataStore.appendToDateList(newDate: fullDate)
    }
}
