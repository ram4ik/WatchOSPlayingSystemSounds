//
//  ContentView.swift
//  WatchOSPlayingSystemSounds WatchKit Extension
//
//  Created by ramil on 21.04.2020.
//  Copyright © 2020 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var timer: Timer?
    
    var body: some View {
        VStack {
            Button(action: {
                if self.timer == nil {
                    self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
                        WKInterfaceDevice.current().play(.success)
                    })
                } else {
                    self.timer?.invalidate()
                    self.timer = nil
                }
            }) {
                Text("Toggle Sound")
            }
            
            HStack {
                Text(timer == nil ? "Sound Off" : "Sound On")
                
                Image(systemName: "speaker")
            
            }.foregroundColor(timer == nil ? .red : .green)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
