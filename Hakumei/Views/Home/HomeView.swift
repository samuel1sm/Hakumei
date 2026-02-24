import SwiftUI

// Named ProgressTabView to avoid shadowing SwiftUI's built-in ProgressView.
struct HomeView: View {
    var body: some View {
		NavigationStack {
			VStack {
				VStack(alignment: .leading, spacing: 16){
					Text("かな · HAKUMEI")
						.font(.hakumei.appLabel)
						.tracking(3.0)
						.foregroundStyle(.accentGold)
					Text("Good morning,\nAlex さん")
						.foregroundStyle(.textInverted)
						.font(.hakumei.title1)
					Text("Your Japanese journey continues.")
						.foregroundStyle(.textMutedOnDark)
						.font(.hakumei.bodySmall)
				}
				.frame(maxWidth: .infinity, alignment: .leading)
				.frame(height: 220)
				.padding(.horizontal)
				.background(.backgroundHeader)
			}
        }
    }
}

#Preview {
    HomeView()
}
