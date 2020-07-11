//
//  MovieBackgroundCard.swift
//  WatchMeNow
//
//  Created by Fahraoui Zakaria on 11/07/2020.
//  Copyright © 2020 Fahraoui Zakaria. All rights reserved.
//

import SwiftUI

struct MovieBackgroundCard: View {
    
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


struct MovieBackgroundCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackgroundCard()
    }
}
