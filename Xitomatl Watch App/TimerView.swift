//
//  TimerView.swift
//  Xitomatl Watch App
//
//  Created by Alvaro on 26-10-22.
//

import SwiftUI

struct TimerView: View {
    var body: some View {
        let calendar = Calendar.current
        let start = Date.now
        let date = calendar.date(byAdding: .minute, value: 25, to: start)
        VStack {
            Spacer()
            Text(date!, style: .timer)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            .monospacedDigit()
            Spacer()
            HStack {
                Button("Pausar"){
                    print("pausar")
                }.tint(.yellow)
                Button("Parar", role: .destructive){
                    print("parar")
                }
            }
        }
        
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
