import Foundation

class SaveDatePresenter: SaveDatePresenting {
    private let month = "January"
    private unowned let view: SaveDateViewing

    init(view: SaveDateViewing) {
        self.view = view
    }

    func present(day: Int) {
        view.display(viewModel: "\(month) \(day)")
    }

}
