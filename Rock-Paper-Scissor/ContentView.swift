//
//  ContentView.swift
//  Rock-Paper-Scissor
//
//  Created by RANGA REDDY NUKALA on 26/08/20.
//

import SwiftUI

let states = ["Rock", "Paper", "Scissor"]


struct ContentView: View {
    
    let kwidth = UIScreen.main.bounds.size.width
    
    @State private var selection = Int.random(in: 0..<3)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var storyMessage = ""
    @State private var questionNo = 0
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8117647059, green: 0.8745098039, blue: 1, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Rock-Paper-Scissor")
                    .font(.system(size: 34, weight: .bold))
                    .padding(.top,40)
                
                HStack {
                    Text("Player1: Computer")
                        .font(.system(size: 14, weight: .medium))
                    Spacer()
                    Text(storyMessage == "" ? "" : "Last Choosed: \(storyMessage)")
                        .font(.system(size: 14, weight: .medium))
                }.padding()
                

                
                Spacer()
                
                Button(action: {
                    checkResult(selected: selection, choice: 0)
                }, label: {
                    Image(states[0])
                        .resizable()
                        .kImageStyle()
                })
                
                HStack {
                    Button(action: {
                        checkResult(selected: selection, choice: 1)
                    }, label: {
                        Image(states[1])
                            .resizable()
                            .kImageStyle()
                    })
                    Button(action: {
                        checkResult(selected: selection, choice: 2)
                    }, label: {
                        Image(states[2])
                            .resizable()
                            .kImageStyle()
                    })
                }
                
                Text(scoreTitle)
                 .font(.system(size: 15, weight: .medium))
                    .padding()
                
                Text("Score: \(score)")
                .font(.system(size: 24, weight: .semibold))
                   .padding()
                
                Spacer()
                Spacer()

            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text("Game Over"), message: Text("You Scored \(score) 🌟"), dismissButton: .default(Text("OK")) {
                reset();
            })
    }
        
    }
    
    func reset() {
        score = 0
        storyMessage = ""
        scoreTitle = ""
        showingScore = false
    }
    
    func checkResult(selected: Int,choice: Int) {
        
        
        selection = Int.random(in: 0..<3)
        questionNo+=1
        
        
        if(selected == choice) {
                scoreTitle = "Its Tie"
                storyMessage = states[selected]
            }else{
                if(selected==0&&choice==2||selected==1&&choice==0||selected==2&&choice==1){
                    scoreTitle = "You lost the Game"
                    if(score != 0) {
                        score-=1
                    }
                    storyMessage = states[selected]
                }else{
                    scoreTitle = "You Won the game"
                    score+=1
                    storyMessage = states[selected]
                }
            }
        
        if(questionNo == 10) {
            questionNo = 0
            showingScore = true
        }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
