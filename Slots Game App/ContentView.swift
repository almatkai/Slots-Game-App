//
//  ContentView.swift
//  Slots Game App
//
//  Created by Almat Kairatov on 05.06.2022.
//

import SwiftUI

struct ContentView: View {

    @State var credits = 100
    @State var slot1 = "cherry"
    @State var slot2 = "cherry"
    @State var slot3 = "cherry"
    let fruits: [String] = ["cherry", "star", "apple"]

    var body: some View {

        VStack{
            Spacer()
            Text("SwiftUI Slots Game").font(.largeTitle)
            Spacer()
            Text("Credits: " + String(credits))
            Spacer()
            HStack{
                Image(slot1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                Image(slot2)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                Image(slot3)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Spacer()
            HStack{
                Button{

                    credits -= 1

                    //Change fruits
                    slot1 = fruits[Int.random(in: 0 ... 2)]
                    slot2 = fruits[Int.random(in: 0 ... 2)]
                    slot3 = fruits[Int.random(in: 0 ... 2)]

                    //Add points if the same
                    if (slot1 == slot2 && slot2 == slot3 && slot3 == slot1){
                        credits += 10
                    }

                }label:{
                    ZStack{
                        Text("Spin")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .frame(width: 100, height: 50)
                            .background(Color(red: 0.98, green: 0.314, blue: 0.455))
                            .cornerRadius(25)
                            .font(.system(size: 18, weight: .bold, design: .default))
                    }
                }
                Button{
                    
                    credits = 100
                    
                    slot1 = "cherry"
                    slot2 = "cherry"
                    slot3 = "cherry"

                }label:{
                    ZStack{
                        Text("Restart")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .frame(width: 100, height: 50)
                            .background(Color(red: 0.98, green: 0.314, blue: 0.455))
                            .cornerRadius(25)
                            .font(.system(size: 18, weight: .bold, design: .default))
                    }
                }
            }
            Spacer()
            Spacer()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}
