//
//  CardFullscreenView.swift
//  QRWallet
//
//  Created by Leonid Zemtsov on 17.02.2022.
//

import SwiftUI

struct CardFullscreenView: View {
    
    //MARK: - Variable
    //Основной QR
    @ObservedObject var card: Card
    
    //Анимация копирования текста
    @State private var copyText = false
    
    //Кнопка поделится
    @State private var isShowingSharingSheet = false
    
    //Кнопка изменения текста
    @FocusState private var nameIsFocused: Bool
    
    
    //MARK: -
    var body: some View {
        
        ScrollView(.vertical) {
            //MARK: Name QR
            HStack(spacing: 65) {
                TextField("\(card.name)", text: $card.name)
                    .font(.system(size: 40, weight: .heavy, design: .default))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .focused($nameIsFocused)
                    .padding(.top, 25)
                    .padding(.bottom, 10)
                
            }.frame(width: 340)
            
            
            //MARK: Image QR
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
            
            
            //MARK: QR Data
            VStack {
                if copyText {
                    HStack {
                        Image(systemName: "heart.fill").foregroundColor(Color.red)
                        Text("Успешно скопировано").bold()
                    }
                    
                } else {
                    Text("\(card.qr.text)")
                        .font(.body)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.leading)
                }
            }
                .frame(width: 310)
                .padding(.bottom, 20)
                .mask(RoundedRectangle(cornerRadius: 0))
                .scaleEffect(copyText ? 1.1 : 1)
                .animation(.spring(response: 0.4, dampingFraction: 0.6), value: copyText)
                .onTapGesture {
                    copyText = true
                    UIPasteboard.general.string = card.qr.text
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                                    copyText = false
                                }
                }
            
            Spacer()

            //MARK: Edit buttons
            
            HStack {
            
                //MARK: Share Button
                Button(action: {
                    self.isShowingSharingSheet = true
                }) {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                    }
                    .frame(width: 160, height: 50)
                    .background(.ultraThickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                }.sheet(isPresented: $isShowingSharingSheet, content: {
                    ShareSheet(activityItems: [card.qr.image], applicationActivities: nil)
                })
                
                
                //MARK: Pin Button
                Button(action: {
                    card.pinned.toggle()
                    
                }) {
                    HStack {
                        if card.pinned {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(.yellow)
                        }
                        
                    }
                    .frame(width: 160, height: 50)
                    .background(.ultraThickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    
                }
                    
                
            }
            
            
            //MARK: Del Button
            Button(action: {
                
            }) {
                Text("Delete")
                    .frame(width: 330, height: 50)
                    .foregroundColor(.red)
                    .background(.ultraThickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            }
            

            
        }
        
        
        
    }
}


//MARK: - Extra struct
struct ShareSheet: UIViewControllerRepresentable {

    let activityItems: [Any]
    let applicationActivities: [UIActivity]?

    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareSheet>) -> UIActivityViewController {
        return UIActivityViewController(activityItems: activityItems,
                                        applicationActivities: applicationActivities)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController,
                                context: UIViewControllerRepresentableContext<ShareSheet>) {

    }
}
