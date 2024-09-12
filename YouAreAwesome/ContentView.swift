//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Anora Zhu on 9/2/24.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var messageString = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    @State private var soundName = ""
    @State private var lastSoundNumber = -1
    
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

            Spacer()
            
            Button("Show Message") {
                
                let messages = ["You Are Awesome!",
                                "You Are Great!",
                                "You are Fantastic!",
                                "Fabulous! That's You!",
                                "You Make ME Smile!",
                                "When the Genius Bar Need Help, They Call You!"
                ]
                
                lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBound: messages.count-1)
                messageString = messages[lastMessageNumber]
                
                lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: 9)
                imageName = "image\(lastImageNumber)"
                
                lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBound: 5)
                playSound(soundName: "sound\(lastSoundNumber)")
                
            }
            .buttonStyle(.borderedProminent)
            
            .padding()
        }
        
    }
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name:soundName) else {
            print("Could not read file name \(soundName)")
            return()
        }
        
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("ERRPR: \(error.localizedDescription) creating audioPlayer.")
        }
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBound: Int) -> Int{
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == lastNumber
        return newNumber
    }
}

#Preview {
    ContentView()
}
