import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
			HomeView()
				.tabItem { Label("Home", systemImage: "house.fill") }

            LearnView()
                .tabItem { Label("Learn", systemImage: "book.fill") }

            QuizView()
                .tabItem { Label("Quiz", systemImage: "checkmark.circle.fill") }

            SettingsView()
                .tabItem { Label("Settings", systemImage: "gearshape.fill") }
        }
    }
}

#Preview("Home Tab View") {
    MainTabView()
}

#Preview("Learn Tab") {
    MainTabView()
}

#Preview("Quiz Tab") {
    MainTabView()
}

#Preview("Progress Tab") {
    MainTabView()
}

#Preview("Settings Tab") {
    MainTabView()
}
