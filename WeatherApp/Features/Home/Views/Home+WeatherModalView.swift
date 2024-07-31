import SwiftUI

extension HomeView {
    struct WeatherModalView: View {
        @ObservedObject var viewModel: HomeView.ViewModel
        @State private var readerHeight: CGFloat = 0
        
        var body: some View {
            ZStack {
                Color.indigo
                    .opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    HomeView.GlassView(viewModel: viewModel)
                        .interactiveDismissDisabled()
                        .presentationDetents([.height(200), .medium])
                        .presentationCornerRadius(50)
                        .padding(.horizontal, 10)
                    Spacer()
                }
            }
            .presentationBackground(.ultraThinMaterial)
        }
    }
}


//#Preview {
//    HomeView.WeatherModalView(weatherData: HomeView.ViewModel().weatherData!)
//}
