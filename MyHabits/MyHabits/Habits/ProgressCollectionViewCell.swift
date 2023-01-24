//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Aleksandr Derevyanko on 23.01.2023.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
    
    struct ViewModel {
        var percent: Float
    }
    
    private let progressTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "Arial", size: 17)
        title.text = "Все получится"
        title.textColor = .systemGray2
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let percentTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "Arial", size: 17)
        title.text = "\(Int((HabitsStore.shared.todayProgress) * (100)))%"
        title.textColor = .systemGray2
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let percentProgress: UIProgressView = {
        let progress = UIProgressView()
//        progress.progress = HabitsStore.shared.todayProgress
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .systemBackground
        layer.cornerRadius = 15
        clipsToBounds = true
//        percentTitle.text = "\(Int((HabitsStore.shared.todayProgress) * (100)))%"
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with viewModel: ViewModel) {
        percentTitle.text = "\(Int((viewModel.percent) * (100)))%"
        percentProgress.progress = viewModel.percent
    }
    
    private func setupUI() {
        addSubview(progressTitle)
        addSubview(percentTitle)
        addSubview(percentProgress)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            progressTitle.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            progressTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            percentTitle.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            percentTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            percentProgress.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            percentProgress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            percentProgress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
    
}
