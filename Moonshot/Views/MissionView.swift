//
//  MissionView.swift
//  Moonshot
//
//  Created by Rex Fang on 2024-03-15.
//

import SwiftUI

struct HorizontalDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

struct MissionView: View {
    let crew: [CrewMember]
    let mission: Mission
    init (mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Corrupted Data: Missing \(member.name)")
            }
        }
    }
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding(.top)
                Text(mission.formattedLaunchDate)
                    .foregroundStyle(.white)
                VStack(alignment: .leading) {
                    HorizontalDivider()
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    Text(mission.description)
                    HorizontalDivider()
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    CrewView(crew: crew)
                }
                
            }
            .padding()
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    return MissionView(
        mission: missions[3],
        astronauts: astronauts
    ).preferredColorScheme(.dark)
}
