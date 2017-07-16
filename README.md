# Basic Clue

## Intro

A basic implementation of the main screen of the Clue iOS app.

## Notable Technical Decisions

I used TDD throughout. The application roughly follows the Clean Architecture.

One main issue is the fact that the knowledge of which month is being displayed is technically held in two places. Both the `SaveDatePresenter` and the `SaveDateInteractor` have knowledge of the month being January in the application. This would mean that, were this to be modified to change based on the current month, two classes would need to change. One way around this would be to have the interactor pass the full month & day string back to the `SaveDateEventController`, which could then pass that on to the presenter, rather than the day `Int`.

Another issue is the way the selection state for the `DayViewModel` is calculated. This currently requires multiple accesses of the data store. Moreover the data store is accessed every time the selected value changes. This is fine with something like `UserDefaults`, but if the data store was replaced with a database then this would become quite inefficient. In that scenario, it would be sensible to add a `DataStore` implementation that combined both an in-memory cache and necessary reads/writes to the database.