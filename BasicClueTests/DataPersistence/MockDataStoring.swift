@testable import BasicClue

class MockDataStoring: DataStoring {
    var didGetDateList = false
    var stubDateList: [String] = []
    func getDateList() -> [String] {
        didGetDateList = true
        return stubDateList
    }

    var didAppendToDateList = false
    var spyNewDate: String? = nil
    func appendToDateList(newDate: String) {
        didAppendToDateList = true
        spyNewDate = newDate
    }

    var didRemoveFromDateList = false
    var spyRemovedDate: String? = nil
    func removeFromDateList(_ date: String) {
        didRemoveFromDateList = true
        spyRemovedDate = date
    }
}
