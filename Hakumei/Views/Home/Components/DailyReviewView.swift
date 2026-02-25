import SwiftUI

struct DailyReviewView: View {
	let cardCount: Int
	let onStartReview: () -> Void
	
	var body: some View {
		ZStack(alignment: .trailing) {
			Text("あ")
				.font(.hakumei.dailyKanji)
				.foregroundStyle(.white.opacity(0.04))
				.offset(.init(width: 0, height: 16))
			
			VStack(alignment: .leading, spacing: 8) {
				Text("DAILY REVIEW")
					.font(.hakumei.caption)
					.tracking(1.5)
					.foregroundStyle(.accentGold)
				
				Text("\(cardCount)")
					.font(.hakumei.kanaHero)
					.tracking(1.5)
					.foregroundStyle(.textInverted)
				
				Text("cards due today")
					.font(.hakumei.bodySmall)
					.foregroundStyle(.textMutedOnDark)

				Button {
					onStartReview()
				} label: {
					Text("Start Review →")
						.font(.hakumei.button)
				}
				.padding()
				.background(.backgroundCard)
				.foregroundStyle(.accentRed)
				.clipShape(RoundedRectangle(cornerSize: .init(width: 16, height: 16)))
			}
			.frame(maxWidth: .infinity, alignment: .leading)
		}
		.padding(.init(top: 16, leading: 24, bottom: 0, trailing: 24))
		.background(.accentRed)
		.clipShape(RoundedRectangle(cornerSize: .init(width: 16, height: 16)))
	}
}

#Preview {
	DailyReviewView(cardCount: 12, onStartReview: {
		print("Start review tapped")
	})
	.padding()
}
