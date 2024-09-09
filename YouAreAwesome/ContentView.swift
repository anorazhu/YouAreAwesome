//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Anora Zhu on 9/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString = ""
    @State private var imageName = ""
//    @State private var imageNumber = 0
//    @State private var messageNumber = 0
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    
    var body: some View {
        VStack {
            
            
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundStyle(.red)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .padding()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .shadow(radius: 30)
                .padding()

            
//            Image(systemName:"speaker.wave.2", variableValue: 0.0)
//                .resizable()
//                .scaledToFit()
//                .symbolRenderingMode(.multicolor)
//                .padding()
//                .background(Color(hue: 0.547, saturation: 0.256, brightness: 0.951))
//                .cornerRadius(30)
//                .shadow(color: .gray, radius: 30, x:20, y: 20)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 30)
//                        .stroke(.teal, lineWidth: 5)
//                )
//                .padding()
            
            
            
            Spacer()
            
            Button("Show Message") {
//                let message1 = "You Are Awesome"
//                let message2 = "You Are Great"
//                if messageString == message1 {
//                    messageString = message1
//                    print(messageString)
//                } else {
//                    messageString = message2
//                    print(messageString)
//                }
//                messageString = (messageString == message1 ? message2 : message1)
//                imageName = (imageName == "image0" ? "image1" : "image0")
                
                let messages = ["You Are Awesome!",
                                "You Are Great!",
                                "You are Fantastic!",
                                "Fabulous! That's You!",
                                "You Make ME Smile!",
                                "When the Genius Bar Need Help, They Call You!"
                ]
                
                var messageNumber = Int.random(in: 0...messages.count-1)
                while messageNumber == lastMessageNumber {
                    messageNumber = Int.random(in: 0...messages.count-1)
                }
                messageString = messages[messageNumber]
                lastMessageNumber = messageNumber
                
                
//                messageString = messages[messageNumber]
//                messageNumber += 1
//                if messageNumber == messages.count {
//                    messageNumber = 0
//                }
//
                //TODO: update the imageName variable
//                imageName = "image\(imageNumber)"
//                imageNumber += 1
//                if imageNumber > 9 {
//                    imageNumber = 0
//                }
                
                
                //Random Selection on images
//                imageName = "image\(Int.random(in: 0...9))"
                var imageNumber = Int.random(in: 0...9)
                while imageNumber == lastImageNumber {
                    imageNumber = Int.random(in: 0...9)
                }
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
            }
            .buttonStyle(.borderedProminent)
            
            
            HStack{
//                Button("Awesome") {
//                    messageString = "You Are Awesome!"
//                }
//                .buttonStyle(.borderedProminent)
//
//                Spacer()
//
//                Button("Great") {
//                    messageString = "You Are Great!"
//                }
//                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
