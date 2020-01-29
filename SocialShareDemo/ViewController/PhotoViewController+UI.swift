//
//  MovieViewController+UI.swift
//  CodableDemo
//
//  Created by Shantaram K on 06/11/19.
//  Copyright © 2019 Shantaram K. All rights reserved.
//

import UIKit

// MARK: - UI Methods

extension PhotoViewController {
    
    func configureUI() {
        setupTableview()
        configureView()

    }
    
    func configureView() {
        
    }
    
    func configureNavigationBar() {
        setNavigationBarTitle("Photos")
    }
    
    func setupTableview() {
        self.tableView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellReuseIdentifier: "PhotoCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.separatorColor = .gray
        self.tableView.estimatedRowHeight = 150
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
 
}
