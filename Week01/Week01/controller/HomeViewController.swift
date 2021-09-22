//
//  HomeViewController.swift
//  Week01
//
//  Created by MD Abir Hasan Zoha on 9/11/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var syllabusTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        syllabusTableView.register(
            TopicTableViewCell.nib,
            forCellReuseIdentifier: TopicTableViewCell.identifier
        )
        
        syllabusTableView.dataSource = self
        syllabusTableView.delegate = self
    }
    
    @IBAction func infoAction(_ sender: Any) {
        performSegue(withIdentifier: "infoScreen", sender: nil)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TopicTableViewCell.identifier,
            for: indexPath
        ) as? TopicTableViewCell else {
            fatalError()
        }
        
        cell.configure(title: "IBOutlet", timeInSecond: 34558, progress: 2.0)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailViewController", sender: nil)
    }
}
