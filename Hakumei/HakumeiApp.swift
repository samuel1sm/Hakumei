//
//  HakumeiApp.swift
//  Hakumei
//
//  Created by Samuel Martins on 19/02/26.
//

import SwiftUI
import SwiftData

@main
struct HakumeiApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            KanaCharacter.self,
			CardProgress.self,
            UserSettings.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            HomeTabView()
                .onAppear { seedDataIfNeeded() }
        }
        .modelContainer(sharedModelContainer)
    }

    private func seedDataIfNeeded() {
        let context = sharedModelContainer.mainContext
        let descriptor = FetchDescriptor<KanaCharacter>()
        let count = (try? context.fetchCount(descriptor)) ?? 0
        guard count == 0 else { return }

        guard
            let url = Bundle.main.url(forResource: "kana_data", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let entries = try? JSONDecoder().decode([KanaEntry].self, from: data)
        else { return }

        for entry in entries {
			guard let type = KanaType(rawValue: entry.type) else { continue }
            context.insert(KanaCharacter(
                id: entry.id,
                unicode: entry.unicode,
                romaji: entry.romaji,
                type: type,
                row: entry.row,
                strokeCount: entry.strokeCount
            ))
        }
    }
}

private struct KanaEntry: Decodable {
    let id: String
    let unicode: String
    let romaji: String
    let type: String
    let row: Int
    let strokeCount: Int
}
