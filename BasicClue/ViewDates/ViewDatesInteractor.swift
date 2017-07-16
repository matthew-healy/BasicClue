import Foundation

class ViewDatesInteractor {
    private let dataStore: DataStoring

    init(dataStore: DataStoring) {
        self.dataStore = dataStore
    }

    func getDates() -> [String] {
        return dataStore.getDateList()
    }
}
