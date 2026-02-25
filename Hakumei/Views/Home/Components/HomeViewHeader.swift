//
//  HomeViewHeader.swift
//  Hakumei
//
//  Created by Samuel Martins on 25/02/26.
//


import SwiftUI

struct HomeViewHeader: View {
	let greeting: String
	let userName: String
	
	var body: some View {
		ZStack(alignment: .trailing) {
			Text("日")
				.font(.hakumei.headerKanji)
				.foregroundStyle(.white.opacity(0.04))
				.offset(.init(width: 0, height: -16))

			VStack(alignment: .leading, spacing: 16){
				Text("かな · HAKUMEI")
					.font(.hakumei.appLabel)
					.tracking(3.0)
					.foregroundStyle(.accentGold)
				Text("\(greeting),\n\(userName) さん")
					.foregroundStyle(.textInverted)
					.font(.hakumei.title1)
				Text("Your Japanese journey continues.")
					.foregroundStyle(.textMutedOnDark)
					.font(.hakumei.bodySmall)
			}
			.frame(maxWidth: .infinity, alignment: .leading)
		}
		.frame(height: 220)
		.padding(.top, 60)
		.padding(.horizontal)
		.background(.backgroundHeader)
	}
}

#Preview("HomeViewHeader") {
	HomeViewHeader(
		greeting: "Good morning",
		userName: "Alex"
	)
}

