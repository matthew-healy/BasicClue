@testable import BasicClue

class MockViewDatesPresenting: ViewDatesPresenting {
    var didPresentDates = false
    var spyPresentedDates: [String]? = nil
    func presentDates(_ dates: [String]) {
        didPresentDates = true
        spyPresentedDates = dates
    }
}
