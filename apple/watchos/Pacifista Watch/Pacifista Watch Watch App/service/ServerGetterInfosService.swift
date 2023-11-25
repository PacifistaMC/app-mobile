//
//  ServerGetterInfosService.swift
//  Pacifista Watch Watch App
//
//  Created by Antoine Pronnier on 24/11/2023.
//

import Foundation

class ServerGetterInfosService {
    
    public static let INSTANCE = ServerGetterInfosService()
    
    private let apiUrl = "https://mcapi.us/server/status?ip="
    private let pacifistaAddress = "play.pacifista.fr"
    
    func fetchPacifistaServerInfo(completion: @escaping (MinecraftServerInfo) -> Void) {
        guard let finalUrl = URL(string: self.apiUrl + self.pacifistaAddress) else {
            print("Error api")
            return
        }
        
        URLSession.shared.dataTask(with: finalUrl) { data, response, error in
            if let error = error {
                print("Error api")
                return
            }
            
            guard let data = data else {
                print("Error api")
                return
            }
            
            do {
                let serverData = try JSONDecoder().decode(MinecraftServerInfo.self, from: data)
                completion(serverData)
            } catch {
                print("Error json")
            }
        }.resume()
        
    }
    
}

