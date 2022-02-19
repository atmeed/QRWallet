//
//  Wallet.swift
//  QRWallet
//
//  Created by Leonid Zemtsov on 08.02.2022.
//

import Foundation


final class Wallet: ObservableObject {
    
    var cards: [Card] = [Card(qr: QR(text: "Test1"), name: "Test1"),Card(qr: QR(text: "Test2"), name: "Test2"), Card(qr: QR(text: "Test2"), name: "Test2") ] //Все карты
    
    
}


