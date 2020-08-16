//
//  HomeView.swift
//  CodeTest
//
//  Created by Farzana Sultana on 8/13/20.
//  Copyright © 2020 Self. All rights reserved.
//

import SwiftUI
import SystemConfiguration

struct HomeView: View {
    
    private let reachability = SCNetworkReachabilityCreateWithName(nil, BASE_URL)
    @State private var showAlert = false
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
                                .font(.system(size: 20))
                                .foregroundColor(Color.black).lineLimit(nil).padding(20)
                        }.onAppear {
                            UITableView.appearance().separatorColor = .clear
                        }
                    } else {
                        VStack(alignment: .center) {
                            Text(viewmodel.processingString)
                        }
                    }
                }
                
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        
                        var flags = SCNetworkReachabilityFlags()
                        SCNetworkReachabilityGetFlags(self.reachability!, &flags)
                        
                        if (!self.isNetworkRechable(with: flags)){
                            self.showAlert = true
                        } else {
                            // CAll API Load Data
                            self.viewmodel.loadData()
                        }
                    }) {
                        Text("Show Data").font(.system(.largeTitle)).foregroundColor(Color.blue).lineLimit(nil).padding(0)
                    }
                    Spacer()
                }
                Spacer()
            }.navigationBarTitle(Text("Code Test"), displayMode: .automatic)       .navigationBarHidden(false).foregroundColor(Color.blue)
                .alert(isPresented: self.$showAlert) {
                    Alert(title: Text("No internet connection"), message: Text("Please try again"), dismissButton: .default(Text("OK")))
            }
            
            
        }
        
    }
    
    private func isNetworkRechable(with flags: SCNetworkReachabilityFlags) -> Bool{
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
        let canConnectionWithoutInteraction = canConnectAutomatically && !flags.contains(.interventionRequired)
        return isReachable && (!needsConnection || canConnectionWithoutInteraction)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
