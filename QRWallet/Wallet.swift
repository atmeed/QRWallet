//
//  Wallet.swift
//  QRWallet
//
//  Created by Leonid Zemtsov on 08.02.2022.
//

import Foundation


final class Wallet: ObservableObject {
    //MARK: - Variables
    
    @Published var cards: [Card] = [Card(qr: QR(text: "хуйкин"))] //Все карты
    
    //MARK: - Function
    
    //Добавление карты
    func addCard(card: Card) {
        self.cards.append(card)
    }
    
    
}


