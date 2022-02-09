//
//  DetailViewController.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 20/1/22.
//

import UIKit
import AVKit

class DetailViewController: UIViewController {
    var tableView: UITableView!
    var viewModel: DetailViewModelProtocol!
    
    convenience init(viewModel: DetailViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
        self.viewModel?.viewDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.white
        setupNavigationBarButtons()
        setupTableView()
    }
    
    private func setupNavigationBarButtons() {
        let backBarButton = UIBarButtonItem(image: UIImage(named: "Back"), style: .plain, target: self, action: #selector(backButtonPressed))
        navigationItem.leftBarButtonItem = backBarButton
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .singleLine
        tableView.sectionHeaderTopPadding = 0.0
        tableView.estimatedRowHeight = 44.0
        tableView.delegate = self
        tableView.dataSource = self
        registerCells()
        
        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(0)
        }
    }
    
    private func registerCells() {
        for cellType in DetailTableItemType.allCases {
            tableView.register(cellType.cellClass, forCellReuseIdentifier: cellType.idCell)
        }
    }
    
    @objc func backButtonPressed() {
        viewModel.eventDidPressBack()
    }

}

// MARK: - UITableViewDataSource
extension DetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModelRow = viewModel.viewModelForIndexPath(indexPath)
        let cell = viewModelRow.type.cellType.cellForTableView(tableView, cellForRowAt: indexPath, idCell: viewModelRow.type.idCell)
        viewModelRow.type.cellType.drawCell(cell: cell, withViewModel: viewModelRow)
        return cell
    }
     
}

// MARK: - UITableViewDelegate
extension DetailViewController: UITableViewDelegate {
    
}


// MARK: - DetailViewProtocol
extension DetailViewController: DetailViewProtocol {
    
    func updateAll() {
        tableView.reloadData()
    }
    
}
