//
//  CharacterTableView.swift
//  Rick and Morty
//
//  Created by Khaled hashem on 18/10/2024.
//

import UIKit
import SwiftUI


struct CharacterTableView: UIViewControllerRepresentable {
    var items: [CharacterDetails]
    var loadDataHandler: (() -> Void)?
    var cardSelectionHandler: ((_ cellIndex: Int) -> Void)?

    func makeUIViewController(context: Context) -> CustomCharacterTableViewController {
        let tableView = CustomCharacterTableViewController()
        tableView.items = items
        tableView.loadDataHandler = loadDataHandler
        tableView.cardSelectionHandler = cardSelectionHandler
        return tableView
    }

    func updateUIViewController(_ uiViewController: CustomCharacterTableViewController, context: Context) {
        uiViewController.items = items
        uiViewController.tableView.reloadData()
    }
}

class CustomCharacterTableViewController: UITableViewController {
    
    var items: [CharacterDetails] = []
    var loadDataHandler: (() -> Void)?
    var cardSelectionHandler: ((_ cellIndex: Int) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .none
        
        let characterCard = CharacterCard(character: items[indexPath.row])
        let hostingController = UIHostingController(rootView: characterCard)

        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(hostingController.view)

        // Keeping a reference to the hosting controller to prevent it from being deallocated
        cell.contentView.subviews.forEach { $0.removeFromSuperview() } // Remove previous views
        cell.contentView.addSubview(hostingController.view) // Add the new one

        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),
        ])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if offsetY > contentHeight - scrollView.frame.size.height {
            loadDataHandler?()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cardSelectionHandler?(indexPath.row)
    }

}
