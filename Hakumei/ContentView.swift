//
//  ContentView.swift
//  Hakumei
//
//  Created by Samuel Martins on 19/02/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LearnView()
                .tabItem { Label("Learn", systemImage: "book.fill") }

            QuizView()
                .tabItem { Label("Quiz", systemImage: "checkmark.circle.fill") }

            ProgressTabView()
                .tabItem { Label("Progress", systemImage: "chart.bar.fill") }

            SettingsView()
                .tabItem { Label("Settings", systemImage: "gearshape.fill") }
        }
    }
}
