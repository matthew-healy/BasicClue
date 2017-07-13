@testable import BasicClue

class MockSaveDateViewDelegate: SaveDateViewDelegate {
    var didCallDisplayViewModel = false
    var spyDisplayViewModel: String? = nil
    func display(viewModel: String) {
        didCallDisplayViewModel = true
        spyDisplayViewModel = viewModel
    }
}
