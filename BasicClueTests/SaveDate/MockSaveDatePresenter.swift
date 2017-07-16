@testable import BasicClue

class MockSaveDatePresenter: SaveDatePresenting {
    var didSetUpScreen = false
    func setUpScreen() {
        didSetUpScreen = true
    }

    var didPresentDay = false
    var spyPresentedDay: Int? = nil
    var spyPresentedSelected: Bool? = nil
    func present(day: Int, selected: Bool) {
        didPresentDay = true
        spyPresentedDay = day
        spyPresentedSelected = selected
    }
}
