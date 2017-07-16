import Foundation

class SaveDatePresenter: SaveDatePresenting {
    private let month = "January"
    private let calendarButtonTitle = "Calendar"
    private unowned let view: SaveDateViewing

    init(view: SaveDateViewing) {
        self.view = view
    }

    func setUpScreen() {
        view.setCalendarButtonTitle(to: calendarButtonTitle)
    }

    func present(day: Int) {
        let viewModel = DateViewModel(day: "\(month) \(day)", isSelected: false)
        view.display(viewModel: viewModel)
    }

}
