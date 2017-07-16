@testable import BasicClue

class MockViewDatesPresenting: ViewDatesPresenting {
    var didPresentScreenTitle = false
    func presentScreenTitle() {
        didPresentScreenTitle = true
    }

    var didPresentDates = false
    var spyPresentedDates: [String]? = nil
    func presentDates(_ dates: [String]) {
        didPresentDates = true
        spyPresentedDates = dates
    }
}
