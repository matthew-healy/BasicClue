@testable import BasicClue

class MockViewDatesViewing: ViewDatesViewing {
    var didDisplayDates = false
    var spyDisplayedDates: [String]? = nil
    func displayDates(_ dates: [String]) {
        didDisplayDates = true
        spyDisplayedDates = dates
    }
}
