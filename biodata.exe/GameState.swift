import Foundation

class GameState: ObservableObject {
    @Published var approval: Double = 0
    @Published var marketValue: Double = 0
    @Published var sanity: Double = 100
    @Published var currentRound: Int = 1
    @Published var choices: [String] = []

    func makeChoice(label: String, isAuthentic: Bool) {
        choices.append(label)

        if isAuthentic {
            sanity -= 10
        } else {
            approval += 15
            marketValue += 10
        }

        sanity = min(max(sanity, 0), 100)
        approval = min(max(approval, 0), 100)
        marketValue = min(max(marketValue, 0), 100)
    }

    func advanceRound() {
        currentRound += 1
    }
}
