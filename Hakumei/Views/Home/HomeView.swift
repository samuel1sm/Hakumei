import SwiftUI

struct HomeView: View {

	@State var viewModel = HomeViewModel()

    var body: some View {
		NavigationStack {
			ScrollView {
				VStack(alignment: .leading, spacing: 20) {
					HomeViewHeader(
						greeting: viewModel.greatingText,
						userName: "Alex"
					)

					VStack(alignment: .leading, spacing: 16) {
						DailyReviewView(
							cardCount: 12,
							onStartReview: {}
						)

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
						
						Text("Learn new")
							.font(.hakumei.sectionTitle)
							.foregroundStyle(.textPrimary)
						
						HomeLearnCardView(
							title: "Hiragana — Row か",
							subtitle: "5 new characters · ~8 min",
							previewText: "かきくけこ"
						)
					}.padding(.horizontal)
					
					Spacer()
				}
				.frame(alignment: .leading)
			}.background(.backgroundPrimary)
			.ignoresSafeArea(edges: .top)
        }
    }
}

#Preview {
	let time = MockTimeService()
	time.hour = 14
	return HomeView(viewModel: .init(timeService: time))
}
