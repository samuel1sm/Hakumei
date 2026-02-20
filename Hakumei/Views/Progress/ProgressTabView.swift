import SwiftUI

// Named ProgressTabView to avoid shadowing SwiftUI's built-in ProgressView.
struct ProgressTabView: View {
    var body: some View {
        NavigationStack {
            Text("Coming soon")
                .navigationTitle("Progress")
        }
    }
}

#Preview {
    ProgressTabView()
}
