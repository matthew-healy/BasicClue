@testable import BasicClue

class MockSaveDateViewDelegate: SaveDateViewing {
    var didSetPageTitle = false
    var spyPageTitle: String? = nil
    func setPageTitle(to title: String) {
        didSetPageTitle = true
        spyPageTitle = title
    }

    var didSetCalendarButtonTitle = false
    var spyCalendarButtonTitle: String? = nil
    func setCalendarButtonTitle(to title: String) {
        didSetCalendarButtonTitle = true
        spyCalendarButtonTitle = title
    }

    var didCallDisplayViewModel = false
    var spyDisplayViewModel: DateViewModel? = nil
    func display(viewModel: DateViewModel) {
        didCallDisplayViewModel = true
        spyDisplayViewModel = viewModel
    }
}
