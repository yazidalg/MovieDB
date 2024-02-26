//
//  HomeView.swift
//  MovieDB
//
//  Created by Yazid Al Ghozali on 21/02/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        Text("Hello, World! \(viewModel.popularMovieList.count)")
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
