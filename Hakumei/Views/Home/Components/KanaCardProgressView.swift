import SwiftUI

// MARK: - KanaCardProgressView

struct KanaCardProgressView: View {
	let title: String
	let progress: String
	let previewText: String
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
				Text(previewText)
					.font(.hakumei.kanaPreview)
					.foregroundStyle(.textSecondary)
					.tracking(4.0)
			}
			GradientProgressBar(value: progressValue).frame(height: 12)
		}
		.padding(.init(top: 24, leading: 16, bottom: 24, trailing: 16))
		.background(.backgroundCard)
		.clipShape(RoundedRectangle(cornerRadius: 16))
		.shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
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
