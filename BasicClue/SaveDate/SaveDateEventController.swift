import Foundation

class SaveDateEventController {
    private let presenter: SaveDatePresenting
    private let interactor: SaveDateInteracting

    private var date = 1

    init(presenter: SaveDatePresenting, interactor: SaveDateInteracting) {
        self.presenter = presenter
        self.interactor = interactor
    }

    func interfaceDidLoad() {
        presenter.setUpScreen()
        presentDateWithSelectionState()
    }

    private func presentDateWithSelectionState() {
        let isDateSelected = interactor.isDateSelected(date)
        presenter.present(day: date, selected: isDateSelected)
    }

    func selected(date: Int) {
        self.date = date
        presentDateWithSelectionState()
    }

    func saveDateButtonTapped() {
        interactor.saveDate(date)
    }
}
