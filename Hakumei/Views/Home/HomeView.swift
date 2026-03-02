import SwiftUI
import SwiftData

struct HomeView: View {

	@State var viewModel = HomeViewModel()
	@Environment(\.modelContext) private var modelContext

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
							progress: viewModel.hiraganaCountText,
							previewText: "あいう",
							progressValue: viewModel.hiraganaProgress
						)
						
						KanaCardProgressView(
							title: "Katakana",
							progress: viewModel.katakanaCountText,
							previewText: "アイウ",
							progressValue: viewModel.katakanaProgress
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
			}
			.background(.backgroundPrimary)
			.ignoresSafeArea(edges: .top)
			.onAppear {
				viewModel.loadOnAppear(context: modelContext)
			}
        }
    }
}

@MainActor
fileprivate func makePreviewContainer() -> ModelContainer {
	let container = try! ModelContainer(
		for: KanaCharacter.self, CardProgress.self, UserSettings.self,
		configurations: .init(isStoredInMemoryOnly: true)
	)
	
	// Populate with mock data
	MockKanaData.populateContext(
		container.mainContext,
		hiraganaProgressCount: 10,
		katakanaProgressCount: 5,
		includeAllCharacters: true
	)
	
	return container
}

#Preview {
	let time = MockTimeService()
	time.hour = 14
	return HomeView(viewModel: .init(timeService: time))
		.modelContainer( makePreviewContainer()
	)
}
