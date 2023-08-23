//
//  HomeDataBinder.swift
//  RomoPlayer
//
//  Created by rouzbeh on 23.08.23.
//

import UIKit


class HomeDataBinder: DataBinder {
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "SongListRow" // Make sure this identifier matches the one you set in your storyboard or cell registration
           
           guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SongListRow else {
               return UITableViewCell() // Return a default cell if casting fails
           }
           let data = cellData[indexPath.row]
            cell.configure(with: data)
        cell.contentView.backgroundColor = .clear
        cell.backgroundColor = .clear
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 10
           return cell
    }
    
}
