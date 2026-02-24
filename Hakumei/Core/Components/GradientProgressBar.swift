import SwiftUI

struct GradientProgressBar: View {
      let value: Double // 0.0 – 1.0                                                                       

      var body: some View {
          GeometryReader { geo in
              ZStack(alignment: .leading) {
                  RoundedRectangle(cornerRadius: 10)
                      .fill(.quaternary)

                  RoundedRectangle(cornerRadius: 10)
                      .fill(LinearGradient(
						colors: [.accentGold, .accentRed],
                          startPoint: .leading,
                          endPoint: .trailing
                      ))
                      .frame(width: geo.size.width * value)
              }
          }
      }
  }

#Preview {
	GradientProgressBar(value: 0.8).frame(height: 20)
}
