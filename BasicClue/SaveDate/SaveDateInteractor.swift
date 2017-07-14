class SaveDateInteractor {
    private let dataStore: DataStoring

    init(dataStore: DataStoring) {
        self.dataStore = dataStore
    }

    func saveDate(_ date: String) {
        dataStore.appendToDateList(newDate: date)
    }
}
