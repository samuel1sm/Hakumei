import SwiftUI

struct CardConfiguration: ViewModifier {

	func body(content: Content) -> some View {
		content
			.background(.backgroundCard)
			.clipShape(RoundedRectangle(cornerRadius: 16))
			.shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
	}
}

extension View {

	func cardStyle() -> some View {
		modifier(CardConfiguration())
	}
}
