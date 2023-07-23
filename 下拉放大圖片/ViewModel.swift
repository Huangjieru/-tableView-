//
//  ViewModel.swift
//  下拉放大圖片
//
//  Created by jr on 2023/7/22.
//

import Foundation

class ViewModel {
    
    let numbers = [0,1,2,3]
   
    var detailViewModels = [DetailViewModel]()
    
    func load() {
        numbers.forEach({ number in
            let detailVM = DetailViewModel()
            detailVM.setViewModel(number: number)
            self.detailViewModels.append(detailVM)
        })
    }
}
