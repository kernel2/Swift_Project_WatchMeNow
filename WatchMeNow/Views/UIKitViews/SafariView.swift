//
//  SwiftUIView.swift
//  WatchMeNow
//
//  Created by Fahraoui Zakaria on 11/07/2020.
//  Copyright © 2020 Fahraoui Zakaria. All rights reserved.
//

import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable {
    
    let url: URL

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let safariVC = SFSafariViewController(url: self.url)
        return safariVC
    }
}
