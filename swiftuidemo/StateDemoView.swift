//
//  ContentView.swift
//  examples
//
//  Created by German Buela on 17/10/2019.
//  Copyright © 2019 German Buela. All rights reserved.
//

import SwiftUI

struct StateDemoView: View {
    @State private var counter: Int = 1
    var body: some View {
        VStack {
            Text("Super App").font(.title)

            Text("Valor actual: \(counter)")
            
            HStack {
                Button(action: { self.counter -= 1 }) { Image(systemName: "minus.rectangle")
                }
                Button(action: { self.counter += 1 }) { Image(systemName: "plus.rectangle")
                }
            }
            Spacer()
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: CGFloat(10 * counter),
                       height: CGFloat(10 * counter),
                       alignment: .center)
            Spacer()
        }
    }
}
