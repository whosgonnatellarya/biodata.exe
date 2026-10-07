import SwiftUI

struct ZenView: View {
    @Binding var currentScreen: AppScreen
    @State private var isPulsing = false

    var body: some View {
        ZStack {
            Color(red: 0.976, green: 0.976, blue: 0.961)
                .ignoresSafeArea()

            VStack {
                Spacer()

                Circle()
                    .fill(Color.white)
                    .frame(width: 160, height: 160)
                    .scaleEffect(isPulsing ? 1.2 : 1.0)
                    .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: isPulsing)
                    .onAppear { isPulsing = true }

                Spacer()

                Button("Start Curation") {
                    currentScreen = .gameboard
                }
                .padding()
                .background(Color.pink)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    ZenView(currentScreen: .constant(.zen))
}
