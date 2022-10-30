//
//  TimerView.swift
//  Xitomatl Watch App
//
//  Created by Alvaro on 26-10-22.
//

import SwiftUI

struct TimerView: View {
    
    @Binding var show:Bool
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeRemaining = 25*60{
        didSet{
            let minutos = timeRemaining/60
            let segundos = timeRemaining % 60
            tiempo = "\(minutos):\(segundos)"
        }
    }
    
    @State var tiempo = "25:00"
    @State var running:Bool
      
    @State var title="Pausar"
    
    var body: some View {
//        let calendar = Calendar.current
//        let start = Date.now
//        let date = calendar.date(byAdding: .minute, value: 25, to: start)
        VStack {
            Spacer()
            Text(tiempo)
                .onReceive(timer){ _ in
                    if timeRemaining != 0  {
                        timeRemaining -= 1
                    }
                }
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            .monospacedDigit()
            Spacer()
            HStack {
                Button(self.title){
                    print("pausar")
                    self.running = !self.running
                    timer.upstream.connect().cancel()
                }.tint(self.running ? .yellow : .green)
                    .onChange(of: running) {_ in
                        self.title = "Seguir"
                        if (running){
                            self.title = "Pausar"
                            self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        }
                    }
                Button("Parar", role: .destructive){
                    print("parar")
                    timer.upstream.connect().cancel()
                    show = false
                }
            }
        }
        
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        
        TimerView(show: .constant(true), running: true)
    }
}
