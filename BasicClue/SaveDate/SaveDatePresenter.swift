import Foundation

class SaveDatePresenter {
    private let month = "January"
    private unowned let view: SaveDateViewDelegate

    init(view: SaveDateViewDelegate) {
        self.view = view
    }

    func present(day: Int) {
        view.display(viewModel: "\(month) \(day)")
    }

}
