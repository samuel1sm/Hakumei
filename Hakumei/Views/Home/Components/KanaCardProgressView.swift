import SwiftUI

// MARK: - KanaCardProgressView

struct KanaCardProgressView: View {

	let title: String
	let progress: String
	let previewText: String?
	let progressValue: Double

	var body: some View {
		VStack(alignment: .leading, spacing: 16) {
			HStack {
				VStack(alignment: .leading, spacing: 10) {
					Text(title)
						.font(.hakumei.cardTitle)
						.foregroundStyle(.textPrimary)
					Text(progress)
						.font(.hakumei.bodySmall)
						.foregroundStyle(.textSecondary)
				}
				Spacer()
				if let previewText {
					Text(previewText)
						.font(.hakumei.kanaPreview)
						.foregroundStyle(.textSecondary)
						.tracking(4.0)
				}
			}
			GradientProgressBar(value: progressValue).frame(height: 12)
			if let previewText, let firstCharacter = previewText.first?.lowercased() {
				Text("Next: Row \(firstCharacter) · \(previewText.count) new characters  →")
					.font(.hakumei.bodySmall)
					.foregroundStyle(.textSecondary)
			}
		}
		.padding(.init(top: 24, leading: 16, bottom: 24, trailing: 16))
		.cardStyle()
	}
}

#Preview("KanaCardProgressView") {
	KanaCardProgressView(
		title: "Hiragana",
		progress: "32 / 46 characters",
		previewText: "あいう",
		progressValue: 0.5
	)
	.padding()
}
