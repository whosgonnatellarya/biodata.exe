import SwiftUI

enum AppScreen {
    case zen, gameboard, submission, reveal

    var next: AppScreen {
        switch self {
        case .zen: return .gameboard
        case .gameboard: return .submission
        case .submission: return .reveal
        case .reveal: return .zen
        }
    }

    var color: Color {
        switch self {
        case .zen: return Color(red: 0.98, green: 0.96, blue: 0.9)
        case .gameboard: return .white
        case .submission: return .black
        case .reveal: return Color(white: 0.5)
        }
    }
}

struct ContentView: View {
    @State var currentScreen: AppScreen = .zen
    @StateObject var gameState = GameState()

    var body: some View {
        Group {
            switch currentScreen {
            case .zen:
                ZenView(currentScreen: $currentScreen)
            default:
                ZStack {
                    currentScreen.color
                        .ignoresSafeArea()

                    Button("Next") {
                        currentScreen = currentScreen.next
                    }
                    .padding()
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
        }
        .environmentObject(gameState)
    }
}


#Preview {
    ContentView()
}
