@testable import BasicClue

class MockViewDatesViewing: ViewDatesViewing {
    var didSetScreenTitle = false
    var spyScreenTitle: String? = nil
    func setScreenTitle(to title: String) {
        didSetScreenTitle = true
        spyScreenTitle = title
    }

    var didDisplayDates = false
    var spyDisplayedDates: [String]? = nil
    func displayDates(_ dates: [String]) {
        didDisplayDates = true
        spyDisplayedDates = dates
    }
}
