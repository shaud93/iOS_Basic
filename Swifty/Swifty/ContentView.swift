//
//  ContentView.swift
//  Swifty
//
//  Created by D'Ante Watson on 11/6/23.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var navi:UINavigationController? = UINavigationController()
    
    var body: some View {
        NavigationStack{
            ZStack {
                Image("Digimon_Blue")
                    .resizable()
                    .frame(width: 400, height: 880)
                        VStack {
                            Text("DIGIMON IDEX")
                                .font(.custom("Techno", size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.995, green: 1.0, blue: 0.209)/*@END_MENU_TOKEN@*/)
                                .padding(.trailing, 80.0)
                            
                            NavigationLink(destination: DIgiGrid()) {
                                Text("GO")
                                    .font(.custom("Techno", size: 50))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(red: 0.69, green: 0.262, blue: 0.318))
                            }
                            .padding(.trailing, 70.0)
                            //RESEARCH RESEARCH RESEARCH RESEARCH
                            Button("SWIFT TO UIKIT"){
                                
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                
                                print(storyboard)
                                
                                let detail = storyboard.instantiateViewController(identifier: "SwiftToUiViewController") as! SwiftToUiViewController
                                
                                navi?.pushViewController(detail, animated: true)
                                
                            }
                            .padding(.trailing, 70.0)
                            
                            NavigationLink(destination: WebView()) {
                                Text("WEB")
                                    .font(.custom("Techno", size: 50))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(red: 0.69, green: 0.262, blue: 0.318))
                            }
                            .padding(.trailing, 70.0)
                            
                            NavigationLink(destination: Tabby()) {
                                Text("TABBY")
                                    .font(.custom("Techno", size: 50))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(red: 0.69, green: 0.262, blue: 0.318))
                            }
                            .padding(.trailing, 70.0)
                            
                    }
            }
            .padding()
        }
    }
}
#Preview {
    ContentView()
}
