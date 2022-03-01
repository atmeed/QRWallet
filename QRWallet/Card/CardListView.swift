//
//  CardListView.swift
//  QRWallet
//
//  Created by Leonid Zemtsov on 17.02.2022.
//

import SwiftUI

struct CardListView: View {
    
    @ObservedObject var card: Card


    //Показ полного окна
    @State private var isPresentedFullscreen = false
    
    init(name: String, text: String) {
        self.card = Card(qr: QR(text: text), name: name)
    }
    
    init(text: String) {
        self.card = Card(qr: QR(text: text))
    }

    
    var body: some View {
        Button(action: {
            
            isPresentedFullscreen.toggle()
            
        }) {
            VStack {
                //Картинка
                Image(uiImage: card.qr.image)
                    .interpolation(.none)
                    .resizable()
                    .frame(width: 143, height: 143)
                    .cornerRadius(10)
                    .scaledToFit()
                    .padding(.bottom, 5)
                    .padding(.top, 15)
                
                //Название
                HStack {
                    Text(card.name)
                        .fontWeight(.bold)
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .padding(.bottom)
                }.frame(width: 141)
                
                    
                
            }
            .frame(width: 175, height: 210)
            .background(.ultraThickMaterial)
            .cornerRadius(25)
        }.sheet(isPresented: $isPresentedFullscreen) {
            CardFullscreenView(card: card)
        }
        
        
    }
}


