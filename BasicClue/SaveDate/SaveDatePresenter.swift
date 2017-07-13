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
        view.display(viewModel: "\(month) \(day)")
    }

}
