//
//  SwitchDemoView.swift
//  examples
//
//  Created by German Buela on 31/10/2019.
//  Copyright © 2019 German Buela. All rights reserved.
//

import SwiftUI

enum Mood {
    case sad, neutral, happy
}

struct BindingDemoView: View {
    @State private var name: String = ""
    @State private var sendNofitications: Bool = false
    @State private var mood: Mood = .neutral
    var body: some View {
        VStack {
            TextField("Nombre", text: $name)
            Toggle(isOn: $sendNofitications) {
                Text("Enviar notificaciones")
            }
            MoodPickerView(currentMood: $mood)
            Spacer()
        }.padding()
    }
}

struct MoodPickerView: View {
    var currentMood: Binding<Mood>
    var body: some View {
        HStack {
            MoodView(mood: .sad,
                     emoji: "🙁",
                     currentMood: currentMood)
            MoodView(mood: .neutral,
                     emoji: "😐",
                     currentMood: currentMood)
            MoodView(mood: .happy,
                     emoji: "🙂",
                     currentMood: currentMood)
        }
    }
}

struct MoodView: View {
    let mood: Mood
    let emoji: String
    var currentMood: Binding<Mood>
    var isSelected: Bool { mood == currentMood.wrappedValue }
    var body: some View {
        Button(action: {
            self.currentMood.wrappedValue = self.mood
        }) {
            Text(emoji)
                .font(.largeTitle)
                .background(isSelected ? Color.blue : Color.clear)
        }
    }
}
