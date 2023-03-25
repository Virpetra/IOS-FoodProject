//
//  SplashView.swift
//  FoodProject
//
//  Created by Mehmet Said Dede on 25.03.2023.
//

import SwiftUI

struct SplashView: View {
    @State private var isSplashDone = false
    @StateObject private var interfaceListViewModel = InterfaceListModel()

    var body: some View {
        VStack {
            Image("splashview")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .onAppear {
            // Splash ekranını 3 saniye göster
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                // InterfaceViewModel'leri önceden indir
                Task {
                    await interfaceListViewModel.downloadInterfaces()
                    self.isSplashDone = true
                }
            }
        }
        .fullScreenCover(isPresented: $isSplashDone, content: {
            InterfaceView().environmentObject(interfaceListViewModel)
        })
    }
}


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
