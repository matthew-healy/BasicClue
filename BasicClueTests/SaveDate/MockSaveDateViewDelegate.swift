@testable import BasicClue

class MockSaveDateViewDelegate: SaveDateViewing {
    var didSetCalendarButtonTitle = false
    var spyCalendarButtonTitle: String? = nil
    func setCalendarButtonTitle(to title: String) {
        didSetCalendarButtonTitle = true
        spyCalendarButtonTitle = title
    }

    var didCallDisplayViewModel = false
    var spyDisplayViewModel: String? = nil
    func display(viewModel: String) {
        didCallDisplayViewModel = true
        spyDisplayViewModel = viewModel
    }
}
