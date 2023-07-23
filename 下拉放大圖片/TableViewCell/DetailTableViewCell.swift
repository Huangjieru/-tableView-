//
//  DetailTableViewCell.swift
//  下拉放大圖片
//
//  Created by jr on 2023/7/22.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    var viewModel: DetailViewModel?
    
    @IBOutlet weak var numberLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setViewModel(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        guard let number = viewModel.number  else { return }
        self.numberLabel.text = String(number)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
