//
//  CellDrawer.swift
//  NFT-ios
//
//  Created by Carlos Jimenez on 4/2/22.
//

import UIKit

protocol TableViewCellDrawer {
    func cellForTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, idCell: String) -> UITableViewCell
    func drawCell(cell: UITableViewCell , withViewModel viewModel: DetailTableItemProtocol)
}

extension TableViewCellDrawer {
    func cellForTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, idCell: String) -> UITableViewCell  {
            return tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath)
    }
}

