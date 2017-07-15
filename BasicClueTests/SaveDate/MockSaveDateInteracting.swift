@testable import BasicClue

class MockSaveDateInteracting: SaveDateInteracting {
    var didSaveDate = false
    var spySavedDate: Int? = nil
    func saveDate(_ date: Int) {
        didSaveDate = true
        spySavedDate = date
    }
}
