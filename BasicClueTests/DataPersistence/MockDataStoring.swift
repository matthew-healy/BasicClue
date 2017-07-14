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
}
