import SwiftUI

struct LearnCardView: View {
	let title: String
	let description: String
	let progressText: String
	let progressValue: Double
	let nextRowText: String
	
	var body: some View {
		VStack(alignment: .leading, spacing: 16) {
			HStack {
				Text(title)
					.font(.hakumei.title2)
					.foregroundStyle(.textPrimary)
				Spacer()
				Image(systemName: "arrow.right")
					.foregroundStyle(.textSecondary)
			}
			
			Text(description)
				.font(.hakumei.bodySmall)
				.foregroundStyle(.textSecondary)
			
			Text(progressText)
				.font(.hakumei.appLabel)
				.foregroundStyle(.accentGold)
			
			GradientProgressBar(value: progressValue)
				.frame(height: 12)
			
			Divider()
			
			Text("Next row:")
				.font(.hakumei.bodySmall)
				.foregroundStyle(.textSecondary)
			
			Text(nextRowText)
				.tracking(10)
				.font(.hakumei.kanaCell)
				.foregroundStyle(.textSecondary)
		}
		.padding(.init(top: 32, leading: 24, bottom: 32, trailing: 24))
		.cardStyle()
	}
}

#Preview {
	LearnCardView(
		title: "Hiragana",
		description: "Basic Japanese phonetic alphabet",
		progressText: "32 / 46 characters learned",
		progressValue: 0.9,
		nextRowText: "あいう"
	)
	.padding()
}

#Preview("Katakana") {
	LearnCardView(
		title: "Katakana",
		description: "Used for foreign words and emphasis",
		progressText: "15 / 46 characters learned",
		progressValue: 0.33,
		nextRowText: "アイウ"
	)
	.padding()
}

#Preview("Just Started") {
	LearnCardView(
		title: "Hiragana",
		description: "Basic Japanese phonetic alphabet",
		progressText: "5 / 46 characters learned",
		progressValue: 0.1,
		nextRowText: "あいうえお"
	)
	.padding()
}
