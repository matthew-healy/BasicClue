@testable import BasicClue

class MockSaveDateInteracting: SaveDateInteracting {
    var didSaveDate = false
    var spySavedDate: Int? = nil
    func saveDate(_ date: Int) {
        didSaveDate = true
        spySavedDate = date
    }

    var didCheckIsDateSelected = false
    var spyDateSelected: Int? = nil
    var stubIsDateSelected: Bool? = nil
    func isDateSelected(_ date: Int) -> Bool {
        didCheckIsDateSelected = true
        spyDateSelected = date
        return stubIsDateSelected ?? false
    }
}
