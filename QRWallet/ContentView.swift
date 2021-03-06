//
//  ContentView.swift
//  QRWallet
//
//  Created by Leonid Zemtsov on 25.01.2022.
//

import SwiftUI
import CodeScanner



struct ContentView: View {
    
    //MARK: - Variables
    
    //Кошелек
    @ObservedObject var wallet = Wallet()
    //Показ 
    @State private var isPresentingScanner = false

    
    //Лист с уже отсканированными кодами
    private var columnCount: Int = 2
    
    
    
    //MARK: -
    var body: some View {
        
        ScrollView(.vertical) {
            
            
            //MARK: Top bar
            VStack {
                
                
                //MARK: Scan Buttons
                HStack {
                    
                    //Camera
                    Button(action: {
                        self.isPresentingScanner = true
                    }) {
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                            .frame(width: 170, height: 60)
                            .background(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
                            .cornerRadius(10)
                    }.sheet(isPresented: $isPresentingScanner) {
                        scannedSheet()
                        #warning("Почини")
                    }
                    
                    //Photo
                    Button(action: {
                        
                    }) {
                        Image(systemName: "photo.on.rectangle.angled")
                            .foregroundColor(.white)
                            .frame(width: 170, height: 60)
                            .background(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
                            .cornerRadius(10)
                    }
                    
                    
                }
            }
            .frame(width: 380, height: 400)
            .background(.ultraThickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            
            
            
            
            //MARK: Card list
            
            VStack {
                ScrollView(.vertical) {
                    let count = wallet.cards.count
                    let rowCount = (Double(count) / Double(columnCount)).rounded(.up)
                    
                    ForEach(0..<Int(rowCount), id: \.self) { row in
                        Spacer()
                        HStack() {
                            ForEach(0..<self.columnCount, id: \.self) { column in
                                let index = row * columnCount + column
                                if index < count {
                                    CardListView(name: self.wallet.cards[index].name , text: self.wallet.cards[index].qr.text)
                                } else {
                                    Spacer().frame(maxWidth: .infinity)
                                }
                                
                            }.frame(width: 180)
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
