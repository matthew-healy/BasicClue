class ViewDatesPresenter: ViewDatesPresenting {
    private unowned let viewDelegate: ViewDatesViewing

    init(view: ViewDatesViewing) {
        self.viewDelegate = view
    }

    func presentDates(_ dates: [String]) {
        viewDelegate.displayDates(dates)
    }
}
