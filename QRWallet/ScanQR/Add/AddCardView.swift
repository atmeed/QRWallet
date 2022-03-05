//
//  AddQRView.swift
//  QRWallet
//
//  Created by Leonid Zemtsov on 03.03.2022.
//

import SwiftUI

struct AddCardView: View {
    //MARK: - Variables
    
    //Закрытие View
    @Environment(\.presentationMode) var presentationMode
    
    //Кошелек
    @ObservedObject var wallet: Wallet = Wallet()
    //Основная карта
    @ObservedObject var card: Card
    
    
    
    //MARK: -
    var body: some View {

        
        VStack {
            
            //MARK: Image
            VStack {
                Image(uiImage: card.qr.image)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 325, height: 325)
                    .background(.ultraThickMaterial)
            }
            .frame(width: 335, height: 335)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            .shadow(radius: 2)
            .padding()
            
            Spacer()
            
            //MARK: - Add bar
            HStack {
            
                //MARK: Cancel Button
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Text("Cancel")
                    }
                    .foregroundColor(.red)
                    .frame(width: 160, height: 50)
                    .background(.ultraThickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                }
                
                
                //MARK: Add Button
                Button(action: {
                    
                    
                }) {
                    Text("Add")
                    .frame(width: 160, height: 50)
                    .background(.ultraThickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    
                }
                    
                
            }.padding()
            
        }
        
        
        
    }
}


