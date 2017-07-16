class ViewDatesPresenter: ViewDatesPresenting {
    private unowned let viewDelegate: ViewDatesViewing

    init(view: ViewDatesViewing) {
        self.viewDelegate = view
    }

    func presentScreenTitle() {
        viewDelegate.setScreenTitle(to: "Calendar")
    }

    func presentDates(_ dates: [String]) {
        viewDelegate.displayDates(dates)
    }
}
