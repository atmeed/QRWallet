//
//  Scaner.swift
//  QRWallet
//
//  Created by Leonid Zemtsov on 03.03.2022.
//

import Foundation
import SwiftUI
import CodeScanner

struct scannedSheet: View {
    
    
    //MARK: - Variables
    
    
    
    //Текст Отсканированного QR
    @State var scannedCode: String = "Scan QR code to get started"  {
        didSet {
            isPresentedAddQR = true
        }
    }
    
    //Показ QR
    @State private var isPresentedAddQR = false
    
    //MARK: - 
    var body: some View {
        
        CodeScannerView (
            codeTypes: [.qr],
            completion:  { result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    if (code.string != "") {
                        self.scannedCode = code.string
                    }
                    
                }
            }
        ).fullScreenCover(isPresented: $isPresentedAddQR) {
            AddCardView(card: Card(qr: QR(text: scannedCode)))
        }
    }
    
}

//MARK: - Other Struct


