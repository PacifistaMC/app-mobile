//
//  MinecraftServerInfo.swift
//  Pacifista Watch Watch App
//
//  Created by Antoine Pronnier on 24/11/2023.
//

class MinecraftServerInfo: Codable {
    
    var players: ServerPlayers
    
    init(players: ServerPlayers) {
        self.players = players
    }
    
    init() {
        self.players = ServerPlayers()
    }
    
}

class ServerPlayers: Codable {
    var max: Int
    var now: Int
    
    init(max: Int, now: Int) {
        self.max = max
        self.now = now
    }
    
    init() {
        self.max = -1
        self.now = -1
    }
}
