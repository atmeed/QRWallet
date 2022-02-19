//
//  CardFullscreenView.swift
//  QRWallet
//
//  Created by Leonid Zemtsov on 17.02.2022.
//

import SwiftUI

struct CardFullscreenView: View {
    //Основной QR
    @State var card: Card
    
    //Анимация копирования текста
    @State private var copyText = false
    
    //Кнопка поделится
    @State private var isShowingSharingSheet = false
    
    
    
    //Закрытие View
    @Environment(\.presentationMode) var presentationMode
    

    var body: some View {
        
        VStack {
            //Выход
            HStack {
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "multiply")
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.black)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .shadow(radius: 15)
                }
                
            }
            
            //Название QR
            HStack(spacing: 65) {
                TextField("\(card.name)", text: $card.name)
                    .font(.system(size: 40, weight: .heavy, design: .default))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    
                    
                    
                
            }.frame(width: 340)
            
            //Сам QR
            VStack {
                Image(uiImage: card.qr.image)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 325, height: 325)
            }
            .frame(width: 350, height: 350)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            .shadow(radius: 5)
            
            //Данные QR
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

            //Кнопки взаимодействия
            HStack {
            
                //Кнопка поделиться
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
                
                //Кнопка удалить
                Button(action: {
                    
                }) {
                    HStack {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                    .frame(width: 160, height: 50)
                    .background(.ultraThickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    
                    
                    
                }
                    
                
            }
            .frame(width: 350)
            
            
            
            
        }.padding()
        
        
    }
}


//Поделитсья
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
