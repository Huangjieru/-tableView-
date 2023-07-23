//
//  ViewController.swift
//  下拉放大圖片
//
//  Created by jr on 2023/7/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel: ViewModel?
    
    @IBOutlet weak var tableView: UITableView!
    
    var headerImageView: UIImageView = {
       let image = UIImageView()
        image.frame = CGRect(x: 0, y: -200, width: UIScreen.main.bounds.width, height: 200)
        image.image = UIImage(named: "image")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ViewModel()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.addSubview(headerImageView)
        tableView.contentInset = UIEdgeInsets(top: 200, left: 0, bottom: 0, right: 0)//header image高設為200，table view最上面讓給header image，header image位置在-200
        tableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailTableViewCell")
        self.viewModel?.load()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return viewModel?.detailViewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        let detailVM = viewModel?.detailViewModels[indexPath.row]
        cell.setViewModel(viewModel: detailVM!)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        230
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        let offsetY = -y/200 //圖片高度200
        
        if -y > 200 {
            headerImageView.transform = CGAffineTransform(scaleX: offsetY, y: offsetY) //scale 縮放，參數 scaleX & y 分別傳入縮放的「比例」
        }
    }
}

