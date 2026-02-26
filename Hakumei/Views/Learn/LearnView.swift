import SwiftUI

struct LearnView: View {
	var body: some View {
		NavigationStack {
			ScrollView {

				VStack(alignment: .leading, spacing: 16) {
					Text("Lern")
						.font(.system(size: 40))
						.bold()
						.foregroundStyle(.textPrimary)

					Text("Choose an alphabet to study")
						.font(.hakumei.bodySmall)
						.foregroundStyle(.textSecondary)

					LearnCardView(
						title: "Hiragana",
						description: "Basic Japonese phoenetic alphabet",
						progressText: "32 / 46 characters lerned",
						progressValue: 0.9,
						nextRowText: "あいう"
					)

					LearnCardView(
						title: "Katakana",
						description: "For foreing words and names",
						progressText: "32 / 46 characters lerned",
						progressValue: 0.9,
						nextRowText: "あいう"
					)
				}
			}
			.padding()
			.background(.backgroundPrimary)
		}
	}
}

#Preview {
	LearnView()
}
