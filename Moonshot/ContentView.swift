//
//  ContentView.swift
//  Moonshot
//
//  Created by Rex Fang on 2024-03-03.
//

import SwiftUI

struct ContentView: View {
  
  let astronauts: [String: Astronaut] = Bundle.main
    .decode("astronauts.json")
  let missions: [Mission] = Bundle.main
    .decode("missions.json")
  
  @State var showingGrid: Bool = true
  
  var body: some View {
    NavigationStack {
      Group {
        if showingGrid {
          MoonshotGridView(missions: missions)
        } else {
          MoonshotListView(missions: missions)
        }
      }
      .navigationTitle("Moonshot")
      .background(.darkBackground)
      .preferredColorScheme(.dark)
      .toolbar {
        Button {
          withAnimation {
            showingGrid.toggle()
          }
        } label: {
          Image(
            systemName: showingGrid ?
            "list.dash" : "square.grid.2x2"
          )
        }
      }
      .navigationDestination(for: Mission.self) { mission in
        MissionView(mission: mission, astronauts: astronauts)
      }
    }
  }
  
}

#Preview {
  ContentView()
}


