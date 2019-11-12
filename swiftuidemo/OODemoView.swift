//
//  OODemoView.swift
//  examples
//
//  Created by German Buela on 01/11/2019.
//  Copyright © 2019 German Buela. All rights reserved.
//

import SwiftUI

class ViewModel: ObservableObject {
    let formats = ["HH:mm:ss", "dd-MM-yyyy HH:mm:ss", "yyyy-MMMM-dd", "HH:mm:ss SSS"]
    var formatIndex = 0 {
        didSet {
            formatter?.dateFormat = formats[formatIndex]
        }
    }
    
    @Published var time: String = "time"

    private var timer: Timer?
    private var formatter: DateFormatter?
    
    init() {
        formatter = DateFormatter()
        formatter?.dateFormat = formats[0]
        startTimer()
    }
    deinit {
        stopTimer()
    }

    @objc
    private func update(timer: Timer) {
        guard let newTime = formatter?.string(from: Date()),
            newTime != time else { return }
        time = newTime
    }
    
    
    private func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(update(timer:)), userInfo: nil, repeats: true)
            timer?.fire()
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

struct OODemoView: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Text(viewModel.time).font(.title)
                FormatPickerView(viewModel: viewModel)
            }
        }
    }
}

struct FormatPickerView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        Form {
            Picker(selection: $viewModel.formatIndex, label: Text("Formato")) {
                ForEach(0..<viewModel.formats.count) {
                    Text(self.viewModel.formats[$0])
                }
            }
        }
    }
}
