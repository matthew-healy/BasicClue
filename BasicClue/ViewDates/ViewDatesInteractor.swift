import Foundation

class ViewDatesInteractor: ViewDatesInteracting {
    private let dataStore: DataStoring

    init(dataStore: DataStoring) {
        self.dataStore = dataStore
    }

    func getDates() -> [String] {
        return dataStore.getDateList()
    }
}
