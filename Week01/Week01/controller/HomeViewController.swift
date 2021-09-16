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
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TopicTableViewCell.identifier,
            for: indexPath
        ) as? TopicTableViewCell else {
            fatalError()
        }
        
        return cell
    }
}
