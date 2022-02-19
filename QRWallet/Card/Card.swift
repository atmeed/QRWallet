//
//  Card.swift
//  QRWallet
//
//  Created by Leonid Zemtsov on 17.02.2022.
//

import Foundation
import SwiftUI


class Card: ObservableObject {
    
    //Основные характеристики карты
    var qr: QR
    var name: String
    
    //Дополнительные характеристики
    var pinned = false //Закреплена ли карта в кошельке
    
    //Основной инициализатор
    init(qr: QR, name: String) {
        self.qr = qr
        self.name = name
    }
    
    //Быстрый инициализатор
    init(qr: QR) {
        self.qr = qr
        self.name = qr.text
    }
    
    
    
    //Закрепление карты в кошельке
    func pinCard() {
        pinned.toggle()
    }
    
    //Отправка фотографии
    func shareImageQR() {
        
    }
    
    
}


