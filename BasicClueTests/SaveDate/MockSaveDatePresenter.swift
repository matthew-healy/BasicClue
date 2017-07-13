@testable import BasicClue

class MockSaveDatePresenter: SaveDatePresenting {
    var didPresentDay = false
    var spyPresentedDay: Int? = nil
    func present(day: Int) {
        didPresentDay = true
        spyPresentedDay = day
    }
}
