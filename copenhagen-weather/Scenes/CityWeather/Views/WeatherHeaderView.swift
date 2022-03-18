//
//  WeatherHeaderView.swift
//  copenhagen-weather
//
//  Created by Vinícius Barcelos on 18/03/22.
//

import UIKit

class WeatherHeaderView: UITableViewHeaderFooterView {
    private lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .light)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 72, weight: .medium)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var weatherConditionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .light)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var minMaxLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.addArrangedSubview(cityNameLabel)
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(weatherConditionsLabel)
        stackView.addArrangedSubview(minMaxLabel)
        return stackView
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupConstraints()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        addSubview(contentStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
        ])
    }
    
    private func configureViews() {
        contentView.backgroundColor = .clear
    }
}

extension WeatherHeaderView {
    func configure(viewData: CityWeatherViewData) {
        cityNameLabel.text = viewData.name
        temperatureLabel.text = viewData.currentTemperature
        weatherConditionsLabel.text = viewData.condition
        minMaxLabel.text = "MIN: \(viewData.minTemperature)     MAX: \(viewData.maxTemperature)"
    }
}
