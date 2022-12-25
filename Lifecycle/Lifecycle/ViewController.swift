//
//  ViewController.swift
//  Lifecycle
//
//  Created by nikita on 19.12.2022.
//

import UIKit

class ViewController: UITableViewController {
    var tapes = [String]()
    var pictures = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Stages of MVC"
        
        tapes += ["init()", "loadView()", "viewDidLoad()", "viewWilAppear", "viewWillDisappear", "viewDidAppear", "viewDidDisappear"]
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try? fm.contentsOfDirectory(atPath: path)
        
        for item in items! {
            if item.hasSuffix(".png") {
                // find picture to load
                pictures.append(item)
            }
        }
        pictures.sort()
        
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tapes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Stage", for: indexPath)
        cell.textLabel?.text = tapes[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedStage = pictures[indexPath.row]
            
            navigationController?.pushViewController(vc, animated: true)
    }
}

}
