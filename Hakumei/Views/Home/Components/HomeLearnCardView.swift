import SwiftUI

struct HomeLearnCardView: View {
	let title: String
	let subtitle: String
	let previewText: String
	
	var body: some View {
		HStack {
			VStack(alignment: .leading, spacing: 16) {
				Text(title)
					.font(.hakumei.cardTitle)
					.foregroundStyle(.textPrimary)

				Text(subtitle)
					.font(.hakumei.bodySmall)
					.foregroundStyle(.textSecondary)
			}
			Spacer()
			Text(previewText)
				.font(.hakumei.kanaPreview)
				.foregroundStyle(.textSecondary)
				.tracking(4.0)
		}
		.padding(.init(top: 24, leading: 16, bottom: 24, trailing: 16))
		.background(.backgroundCard)
		.clipShape(RoundedRectangle(cornerRadius: 16))
		.shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
	}
}

#Preview("HomeLearnCardView") {
	HomeLearnCardView(
		title: "Hiragana — Row か",
		subtitle: "5 new characters · ~8 min",
		previewText: "かきくけこ"
	)
	.padding()
}
