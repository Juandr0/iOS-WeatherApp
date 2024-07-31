import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
}
