import SwiftUI

// Named ProgressTabView to avoid shadowing SwiftUI's built-in ProgressView.
struct HomeView: View {
    var body: some View {
		NavigationStack {
			VStack(alignment: .leading, spacing: 20) {
				HomeViewHeader(
					greeting: "Good morning",
					userName: "Alex"
				)
				
				VStack(alignment: .leading, spacing: 16) {
					Text("Your progress")
						.font(.hakumei.sectionTitle)
						.foregroundStyle(.textPrimary)
					
					KanaCardProgressView(
						title: "Hiragana",
						progress: "32 / 46 characters",
						previewText: "あいう",
						progressValue: 0.5
					)

					KanaCardProgressView(
						title: "Katakana",
						progress: "32 / 46 characters",
						previewText: "アイウ",
						progressValue: 0.5
					)

				}.padding(.horizontal)
				Spacer()
			}
			.frame(alignment: .leading)
			.background(.backgroundPrimary)
        }
    }
}

#Preview {
	HomeView()
}
