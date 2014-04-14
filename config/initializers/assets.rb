# Any global asset initializers go here

Rails.application.config.assets.precompile += %w( screenshots/*.jpg )
Rails.application.config.assets.precompile += %w( amazium/amazium.css amazium/amazium-percent.css amazium/base.css amazium/form.css amazium/layout.css )