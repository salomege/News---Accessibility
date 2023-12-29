//
//  UITableViewRepresentable.swift
//  News
//
//  Created by salome on 29.12.23.
//

import Foundation

import SwiftUI

struct MyTableView: UIViewRepresentable {
    typealias UIViewType = UITableView

    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView()
        tableView.delegate = context.coordinator
        tableView.dataSource = context.coordinator
        return tableView
    }

    func updateUIView(_ uiView: UITableView, context: Context) {
        // Update the table view if needed
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // Return the number of rows in your table
            return 10
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // Configure and return your UITableViewCell
            let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
            cell.textLabel?.text = "Row \(indexPath.row)"
            return cell
        }

    }
}
