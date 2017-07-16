@testable import BasicClue

class MockViewDatesInteracting: ViewDatesInteracting {
    var didGetDates = false
    var stubGetDates: [String]? = nil
    func getDates() -> [String] {
        didGetDates = true
        return stubGetDates ?? []
    }
}
