//
//  MissionGridView.swift
//  Moonshot
//
//  Created by Rex Fang on 2024-03-23.
//

import SwiftUI

struct MoonshotGridItem: View {
  let mission: Mission
  var body: some View {
    NavigationLink(value: mission) {
      VStack {
        Image(mission.image)
          .resizable()
          .scaledToFit()
          .frame(width: 100, height: 100)
          .padding()
        VStack {
          Text(mission.displayName)
            .font(.headline)
            .foregroundStyle(.white)
          Text(mission.formattedLaunchDate)
            .font(.caption)
            .foregroundStyle(.white.opacity(0.5))
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .background(.lightBackground)
      }
      .clipShape(.rect(cornerRadius: 10))
      .overlay(
        RoundedRectangle(cornerRadius: 10)
          .stroke(.lightBackground)
      )
    }
  }
}

struct MoonshotGridView: View {
  let missions: [Mission]
  var body: some View {
    ScrollView {
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
        ForEach(missions) { mission in
          MoonshotGridItem(mission: mission)
        }
      }
      .padding([.horizontal, .vertical])
    }
  }
}
