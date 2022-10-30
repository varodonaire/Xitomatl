//
//  ContentView.swift
//  Xitomatl Watch App
//
//  Created by Alvaro on 26-10-22.
//

import SwiftUI

struct ContentView: View {
    @State private var showDetail=false
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(Color.green)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Button( action: {showDetail = true}){
                    Image(systemName: "timer")
                        .font(.system(size: 150))
                }
                    .background(Color.red)
                    .foregroundColor(Color.white)
                .clipShape(Circle())
        }.sheet(isPresented: $showDetail) {
            TimerView(show: $showDetail, running: true)
                .toolbar(.hidden)
        }
        
    }
    
}

func xitomatl()  {
    print("xitl")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
