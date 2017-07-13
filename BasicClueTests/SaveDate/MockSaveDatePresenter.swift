@testable import BasicClue

class MockSaveDatePresenter: SaveDatePresenting {
    var didSetUpScreen = false
    func setUpScreen() {
        didSetUpScreen = true
    }

    var didPresentDay = false
    var spyPresentedDay: Int? = nil
    func present(day: Int) {
        didPresentDay = true
        spyPresentedDay = day
    }
}
