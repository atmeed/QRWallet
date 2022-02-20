//
//  Wallet.swift
//  QRWallet
//
//  Created by Leonid Zemtsov on 08.02.2022.
//

import Foundation


final class Wallet: ObservableObject {
    
    @Published var cards: [Card] = [Card(qr: QR(text: "хуйкин"))] //Все карты
    
    
}


