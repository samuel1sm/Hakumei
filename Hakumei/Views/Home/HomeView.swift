import SwiftUI

// Named ProgressTabView to avoid shadowing SwiftUI's built-in ProgressView.
struct HomeView: View {
    var body: some View {
		NavigationStack {
			VStack {
				VStack {
					Text("かな · HAKUMEI")
				}.frame(maxWidth: .infinity)
					.background(.backgroundHeader)
			}
        }
    }
}

#Preview {
    HomeView()
}
