//
//  WelcomeView.swift
//  Pacifista Watch Watch App
//
//  Created by Antoine Pronnier on 24/11/2023.
//

import SwiftUI

struct WelcomeView: View {

    private let minecraftService = ServerGetterInfosService.INSTANCE
    
    @State
    private var pacifistaData = MinecraftServerInfo()
    
    @State
    private var showPlayerList = false
    
    var body: some View {
        VStack {
            Text("Pacifista")
            
            Spacer()
            
            Image("PacifistaLogo")
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    self.showPlayerList.toggle()
                }
            
            Spacer()
            
            if (pacifistaData.players.now >= 0) {
                Text("\(pacifistaData.players.now) joueur\( pacifistaData.players.now > 1 ? "s" : "" ) en ligne")
                    .multilineTextAlignment(.center)
                Text("sur \(pacifistaData.players.max)")
                    .multilineTextAlignment(.center)
            } else {
                Text("Impossible de récupérer les informations du serveur.")
                    .multilineTextAlignment(.center)
            }
        }
        .onAppear() {
            minecraftService.fetchPacifistaServerInfo { result in
                self.pacifistaData = result
            }
        }
        .sheet(isPresented: $showPlayerList, content: {
            PlayersView()
        })
    }
}

#Preview {
    WelcomeView()
}

