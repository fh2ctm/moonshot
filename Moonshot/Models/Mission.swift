//
//  Mission.swift
//  Moonshot
//
//  Created by Rex Fang on 2024-03-15.
//

import Foundation

struct Mission: Codable, Identifiable, Hashable {
  struct CrewRole: Codable, Hashable {
    let name, role: String
  }
  let id: Int
  let launchDate: Date?
  let crew: [CrewRole]
  let description: String
  var displayName: String {
    "Apollo \(id)"
  }
  var image: String {
    "apollo\(id)"
  }
  var formattedLaunchDate: String {
    launchDate?.formatted(
      date: .abbreviated,
      time: .omitted
    ) ?? "No Date"
  }
}
