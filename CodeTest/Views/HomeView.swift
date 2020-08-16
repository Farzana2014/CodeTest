//
//  HomeView.swift
//  CodeTest
//
//  Created by Farzana Sultana on 8/13/20.
//  Copyright © 2020 Self. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewmodel = ResultStringViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                if viewmodel.loading {
                    ActivityIndicator(color: Color.blue, size: 50)
                } else {
                    if (viewmodel.resultStrings.requiredString.count > 0) {
                        List {
                            Text(viewmodel.resultStrings.formattedString)
                                .font(.system(size: 15))
                                .foregroundColor(Color.black).lineLimit(nil).padding(20)
                        }.onAppear {
                            UITableView.appearance().separatorColor = .clear
                        }
                    } else {
                        VStack(alignment: .center) {
                            Text("No Data or error")
                        }
                    }
                }
                
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        // CAll API Load Data
                        self.viewmodel.loadData()
                    }) {
                        Text("Tap").font(.system(.largeTitle)).foregroundColor(Color.blue).lineLimit(nil).padding(0)
                    }
                    Spacer()
                }
                Spacer()
            }.navigationBarTitle(Text("Code Test"), displayMode: .automatic)       .navigationBarHidden(false).foregroundColor(Color.blue)
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
