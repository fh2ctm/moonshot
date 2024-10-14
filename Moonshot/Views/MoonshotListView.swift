//
//  MissionListView.swift
//  Moonshot
//
//  Created by Rex Fang on 2024-03-23.
//

import SwiftUI

struct MoonshotListItem: View {
    let mission: Mission
    var body: some View {
        NavigationLink(value: mission) {
            HStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                VStack(alignment: .leading) {
                    Text(mission.displayName)
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text(mission.formattedLaunchDate)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.5))
                }
                .padding([.horizontal])
            }
        }
    }
}

struct MoonshotListView: View {
    let missions: [Mission]
    var body: some View {
        List(missions) { mission in
            MoonshotListItem(mission: mission)
        }
    }
}
