//
//  ContentView.swift
//  QRWallet
//
//  Created by Leonid Zemtsov on 25.01.2022.
//

import SwiftUI




struct ContentView: View {
    
    @ObservedObject var wallet = Wallet()
    
    private var columnCount: Int = 2
    
    
    var body: some View {
        ScrollView(.vertical) {
            let count = wallet.cards.count
            let rowCount = (Double(count) / Double(columnCount)).rounded(.up)
            ForEach(0..<Int(rowCount)) { row in
                Spacer()
                HStack() {
                    ForEach(0..<self.columnCount) { column in
                        let index = row * columnCount + column
                        if index < count {
                            CardListView(name: self.wallet.cards[index].name , text: self.wallet.cards[index].qr.text).padding(.horizontal, 2)
                        } else {
                            Spacer().frame(maxWidth: .infinity)
                        }
                        
                    }
                }
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
