//
//  DetailViewController.swift
//  Lifecycle
//
//  Created by nikita on 19.12.2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedStage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Stage - \(selectedStage!)"
        
        if let imageToLoad = selectedStage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    

}
