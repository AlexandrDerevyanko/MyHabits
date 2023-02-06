//
//  DetailsTableViewCell.swift
//  MyHabits
//
//  Created by Aleksandr Derevyanko on 02.02.2023.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    struct ViewModel {
        var dateIndex: Int?
        var habit: Habit?
        var index: Int?
    }
    
    var index: Int = 0
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let checkmark: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "checkmark")
        image.isHidden = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setup(with viewModel: ViewModel) {
        let trackDateString = HabitsStore.shared.trackDateString(forIndex: viewModel.dateIndex!)
        label.text = trackDateString
        if HabitsStore.shared.habit(viewModel.habit!, isTrackedIn: HabitsStore.shared.dates[viewModel.dateIndex!]) == true {
            checkmark.isHidden = false
        }
        
    }
    
    private func setupUI() {
        addSubview(label)
        addSubview(checkmark)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            checkmark.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            checkmark.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
